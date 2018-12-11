#{{{ Marathon
require_fixture 'default'
#}}} Marathon

name("Check Box Test")
description("Asserting Checkbox state")
severity("normal")

def test

    with_window("Ensemble") {
        select("list", "true")
        click("list-view_1", "Controls")
        click("list-view_2", "Check Box")
        assertCheckBox()
    }

end


def assertCheckBox()
  with_window("Ensemble"){
    # select the simple checkbox.
    # Using driver.find_elements by css to find checkboxs
    checkBoxs = driver.find_elements(:css , "check-box")
    # Find the Check box with text 'Simple checkbox'
    simpleCheckBox = checkBoxs.find {|c| c['text'] == 'Simple checkbox'}
    # Click on the Check box
    simpleCheckBox.click
    # Assert the checkbox with driver.find_element by complete css path of the element
    assert_equals simpleCheckBox, driver.find_element(:css, "check-box[text = 'Simple checkbox']")

    # Find the checkbox using complete css path
    threeStateCheckBox = driver.find_element(:css , "check-box[indexOfType = '1']")
    assert_equals "Three-state checkbox" , threeStateCheckBox.text
    # Assert the state of the check box
    assert_equals "false", threeStateCheckBox['component.indeterminate']
    assert_equals "false", threeStateCheckBox['component.selected']
    # Click on the checkbox
    threeStateCheckBox.click
    # Check the state of the component is indeterminate.
    assert_equals "true", threeStateCheckBox['component.indeterminate']
    #select("Three-state checkbox", "indeterminate")
    threeStateCheckBox.click
    # Assert the check box is in selected state.
    assert_equals "false", threeStateCheckBox['component.indeterminate']
    assert_equals "true", threeStateCheckBox['component.selected']
  }
end
