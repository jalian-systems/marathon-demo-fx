#{{{ Marathon
require_fixture 'default'
#}}} Marathon

name("Test Text Field")
description("Test Text field component")
severity("normal")

def test

    with_window("Ensemble") {
        select("list", "true")
        click("list-view_1", "Controls")
        click("list-view_2", "Text")
        click("list-view_3", "Text Field")
        assert_p("text-field_0", "text", "Text")
        doubleclick("text-field_0")
        select("text-field_0", "Hello World")
        assert_p("text-field_0", "text", "Hello World")
    }

end
