#{{{ Marathon
require_fixture 'default'
#}}} Marathon

name("Test Color Button")
description("Assert button color")
severity("normal")

def test

    with_window("Ensemble") {
        select("list", "true")
        click("list-view_1", "Controls")
        click("list-view_2", "Button")
        click("list-view_3", "Colored Buttons")
        click("Red")
        click("Orange")
        click("Color")
        click("Toggle Tab Mode_2")
        click("Color_2")
        click("Toggle Tab Mode_2")
        click("Color")
        click("Color_3")
        click("Color_4")
        click("Color_5")
        click("Violet")
        click("Indigo")
        click("Blue")
        assert_p("Blue", "text", "Blue")
    }

end
