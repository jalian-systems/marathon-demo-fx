#{{{ Marathon
require_fixture 'default'
#}}} Marathon

name("Test Date Picker")
description("Assert Date from Date Picker")
severity("normal")

def test

    with_window("Ensemble") {
        select("list", "true")
        click("list-view_1", "Controls")
        click("list-view_2", "DatePicker")
        assertDatePicker()
    }

end


def assertDatePicker()
  with_window("Ensemble"){
    # Use the date picker and select a date.
    datePicker = driver.find_element(:css , "date-picker")
    # Selecting the date using call-select method.
    datePicker.find_element(:css, ".::call-select('7/12/2018')")
    # Selecting the date using execute-script method.
    driver.execute_script("$1.setValue(java.time.LocalDate.of(2018,12,01));" , datePicker)
    #select("date-picker_0", "7/12/2018")
    assert_equals datePicker.text , "1/12/2018"
  }
end
