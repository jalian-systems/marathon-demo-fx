#{{{ Marathon
require_fixture 'default'
#}}} Marathon

name("Test Spinner ")
description("Test Spinner ")
severity("normal")

def test

    with_window("Ensemble") {
        select("list", "true")
        click("list-view_1", "Controls")
        click("list-view_2", "SpinnerApp")
        assertSpinner()
    }

end


def assertSpinner()
  with_window("Ensemble"){
    # Set the value of the spinner by using marathon's select method.
    select("spinner_0", "2")
    # Assert the value using assert_equals
    assert_equals "2", driver.find_element(:css, "spinner[indexOfType= '0']").text
    
    # Lets get an interger spinner and set value and assert it by using driver.find_element by css path
    spinner = driver.find_element(:css , "spinner[indexOfType ='0']")
    driver.execute_script('$1.getValueFactory().setValue(java.lang.Integer.valueOf(9));',spinner)
    # Assert the value of the spinner
    assert_equals "9", spinner.text
    
    # Lets get a Double spinner and set value and assert it by using driver.find_element by css path
    spinner2 = driver.find_element(:css , "spinner[indexOfType ='6']")
    driver.execute_script('$1.getValueFactory().setValue(java.lang.Double.valueOf("0.49"));',spinner2)
    
    # Lets get an string spinner and set value to the spinner.
    spinner3 = driver.find_element(:css , "spinner[indexOfType ='12']")
    driver.execute_script('$1.getValueFactory().setValue("Matt");',spinner3)
    
    spinner5 = driver.find_element(:css , "spinner[indexOfType ='11']")
    driver.execute_script('$1.getValueFactory().setValue(java.lang.Double.valueOf("0.51"));',spinner5)
    assert_equals "0.51", spinner5.text
  }
end

