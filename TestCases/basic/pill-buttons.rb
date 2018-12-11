#{{{ Marathon
require_fixture 'default'
#}}} Marathon

name("Pill buttons Test")
description("Assert pill buttons (Toggle Buttons)")
severity("normal")

def test

    with_window("Ensemble") {
        select("list", "true")
        click("list-view_1", "Controls")
        click("list-view_2", "Button")
        click("list-view_3", "Pill Button")
        select("Center", "true")
        select("Right", "true")
        select("Left", "true")
        assert_p("Left", "text", "Left")
    }

end
