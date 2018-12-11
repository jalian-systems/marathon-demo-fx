#{{{ Marathon
require_fixture 'default'
#}}} Marathon

name("Test Dialogs")
description("Test Dialogs of different types")
severity("normal")

def test

    with_window("Ensemble") {
        select("list", "true")
        click("list-view_1", "Controls")
        click("list-view_2", "DialogApp")
        assertDialog()
    }

end

def assertDialog()
  with_window("Ensemble"){

    # Create a new Alert
    comboBoxAlert = driver.find_element(:css ,"combo-box")
    driver.execute_script('$1.getSelectionModel().select("Warning");',comboBoxAlert)
    #select("combo-box_0", "Warning")

    alertButton = driver.find_element(:css , "button[cText = 'Create Alert']")
    alertButton.click
    assert_equals "Create Alert" , alertButton.text
    #click("Create Alert")

    with_window("Warning") {
      # Click on the Warning alert.
      warningAlert = driver.find_element(:css,"button[cText = 'OK']")
      warningAlert.click
      assert_equals "OK" , warningAlert.text
    }

    with_window("Ensemble") {
      # click on the text input dialog.
      inputDialog = driver.find_element(:css , "button[cText = 'Create Text Input Dialog']")
      inputDialog.click
      assert_equals "Create Text Input Dialog" , inputDialog.text
  #    click("Create Text Input Dialog")
    }

    with_window("Text Input Dialog") {
      #Enter the text inside the text field.
      textFieldInput = driver.find_element(:css,"text-field")
      textFieldInput.clear
      textFieldInput.send_keys("Jalian Systems")
      assert_equals "Jalian Systems" , textFieldInput.text
      #select("text-field_0" , "Jalian Systems")
    }
  }
end
