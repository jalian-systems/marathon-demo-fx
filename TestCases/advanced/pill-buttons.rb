#{{{ Marathon
require_fixture 'default'
#}}} Marathon

name("Test pill buttons")
description("Testing buttons using selemium calls")
severity("normal")

def test

 with_window("Ensemble") {
        select("list", "true")
        click("list-view_1", "Controls")
        click("list-view_2", "Button")
        click("list-view_3", "Pill Button")
        assertButtons()
    }

end

def assertButtons()
  with_window("Ensemble"){
    # Use driver.find_elements to find all buttons
    buttons = driver.find_elements(:css , 'toggle-button')
    # You can look for a button using the text on the button
    $center_button = buttons.find { |b|  b.text== 'Center' }
    center_button = buttons.find { |b|  b.text== 'Center' }
    # And then click on it
    center_button.click
    # Or get some attibutes
    selected = center_button.selected?
    # And assert...
    assert_equals true, selected

    # You can also find the button using any property/attribute
    assert_equals center_button, driver.find_element(:css, 'toggle-button[text="Center"]')

    # Do you want to check weather the button is enabled?
    assert_equals true, center_button.enabled?

    # Though rare, you can use execute_script to operate on the button
    driver.execute_script "$1.setDisable(true);", center_button
    assert_equals false, center_button.enabled?

    # Lets enable it again - if not click will fail!!
    driver.execute_script "$1.setDisable(false);", center_button
    assert_equals true, center_button.enabled?

    # If we have used Component#setId, we can use the id to get the button
    driver.execute_script '$1.setId("centerButton");', center_button
    assert_equals 'centerButton', center_button['id']
    assert_equals center_button, driver.find_element(:id, 'centerButton')

    # You can find element using their class. Note the fully qualified
    # class name. These can be user classes also.
    toggle_buttons  = driver.find_elements(:class, "javafx.scene.control.ToggleButton")
    puts toggle_buttons.length
  }


end
