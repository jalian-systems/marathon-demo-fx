#{{{ Marathon
require_fixture 'default'
#}}} Marathon

name("Color Picker Test")
description("Test Color picker and asserting it")
severity("normal")

def test

    with_window("Ensemble") {
        select("list", "true")
        click("list-view_1", "Controls")
        click("list-view_2", "ColorPicker")
        assertColorPicker()
    }

end


def assertColorPicker()
  with_window("Ensemble"){
    # We can get the color picker component using get_component
    color_picker = get_component('color-picker_0')
    $cps = driver.find_elements(:css, 'color-picker')
    # If there are no color pickers then return
    # elsif lenght is 1 then assert the color picker
    # elsif lenght is more than one then get the required color picker by indexOfType
    if $cps.length ==0
      return
    elsif $cps.length == 1
      assert_equals color_picker , $cps[0]
    elsif $cps.length >1
      assert_equals color_picker, $cps.find {|c| c['indexOfType']=='0'}
    end

    # A select uses internally setColor. You can also use drive.execute_script
    driver.execute_script('$1.setValue(javafx.scene.paint.Color.valueOf("#ff3366"));', color_picker)
    select("color-picker_0", "#ff5232")
    select("color-picker_0", "#ff3366")
    assert_equals "#ff3366", color_picker['text']

    # Assert the color picker value with color label
    labels = driver.find_elements(:css , 'text')
    colorLabel = labels.find{ |l| l['text'] =='Colors'}
    assert_equals '0xff3366ff', colorLabel['component.fill']
  }
end

