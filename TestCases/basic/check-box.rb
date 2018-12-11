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
        select("Simple checkbox", "checked")
        select("Three-state checkbox", "indeterminate")
        select("Three-state checkbox", "checked")
        select("Three-state checkbox", "unchecked")
        select("Simple checkbox", "unchecked")
        doubleclick("Simple checkbox")
        select("Simple checkbox", "checked")
        assert_p("Simple checkbox", "enabled", "true")
        assert_p("Simple checkbox", "text", "Simple checkbox")
        assert_p("Three-state checkbox", "component.selected", "false")
        select("Three-state checkbox", "indeterminate")
        assert_p("Three-state checkbox", "component.indeterminate", "true")
    }

end
