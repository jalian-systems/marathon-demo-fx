#{{{ Marathon
require_fixture 'default'
#}}} Marathon

name("Test HTML Editor")
description("Assert content in HTML Editor")
severity("normal")

def test

    with_window("Ensemble") {
        select("list", "true")
        click("list-view_1", "Controls")
        click("list-view_2", "HTML Editor")
        assert_p("Color_5", "text", "Show the HTML below")
        select("combo-box_2", "36 pt")
        select("combo-box_2", "36 pt")
        select("combo-box_2", "14 pt")
        click("Color_5")
        assert_p("html-editor_0", "text", "<html dir=\"ltr\"><head></head><body contenteditable=\"true\">Lorem ipsum dolor sit amet, consectetur adipiscing elit.Nam tortor felis, pulvinar in scelerisque cursus, pulvinar at ante. Nulla consequat congue lectus in sodales.  </body></html>")
    }

end
