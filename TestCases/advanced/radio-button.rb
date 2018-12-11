#{{{ Marathon
require_fixture 'default'
#}}} Marathon

name("Test Radio Button")
description("Test Radion button (Toggle button)")
severity("normal")

def test

    with_window("Ensemble") {
        select("list", "true")
        click("list-view_1", "Controls")
        click("list-view_2", "Radio Button")
        assertRadioButton()
    }

end


def assertRadioButton()
  with_window("Ensemble"){
    # Get list of all the radio buttons
    radioButtons = driver.find_elements(:css , "radio-button")
    # Get radio buttons with name 'Bye' and 'Hello'
    bRadioButton = radioButtons.find{ |r| r.text =~ /Bye/ }
    # Assert the radio button is selected?
    assert_equals true , bRadioButton.selected?
    hRadioButton = radioButtons.find { |r| r.text =~ /Hello/ }
    assert_equals false , hRadioButton.selected?
    # Click on the hRadioButton
    hRadioButton.click
    # Assert the if the hRadioButton is selected state?
    assert_equals true , hRadioButton.selected?
    assert_equals false , bRadioButton.selected?
  }
end

