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
        assert_p("Bye", "text", "Bye")
        assert_p("Hello", "text", "Hello")
        assert_p("Hello", "component.selected", "false")
        select("Hello", "true")
        assert_p("Hello", "component.selected", "true")
    }

end
