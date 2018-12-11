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
        click("Colored Control")
        click("Colors", 1, 77, -13)
        select("color-picker_0", "#ff6666")
        assert_p("Colors", "component.fill", "0xff6666ff")
    }


end
