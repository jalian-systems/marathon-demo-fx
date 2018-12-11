#{{{ Marathon
require_fixture 'default'
#}}} Marathon

name("Test Text Field")
description("Test Text field component")
severity("normal")

def test

    with_window("Ensemble") {
        select("list", "true")
        click("list-view_1", "Controls")
        click("list-view_2", "Text")
        click("list-view_3", "Text Field")
        assertTextArea()
    }

end


def assertTextArea()
  with_window("Ensemble"){
    # Find text field by using driver.find element (using css)
    textArea = driver.find_element(:css, "text-field")
    # As there is only one text-field  we use it
    # Assert the initial value of the text field.
    assert_equals "Text", textArea.text
    # Clear the test text field.
    textArea.clear
    # Send keys to the test field.
    textArea.send_keys("Jalian Systems")
    #Assert the keys sent to the text field
    assert_equals "Jalian Systems" , textArea.text
    
    # Set value of the text field using driver.execute_script
    driver.execute_script('$1.setText("Hello World");', textArea)
    # Now assert the value of the text field sent using driver.execute script
    assert_equals "Hello World", textArea.text  
  }
end
