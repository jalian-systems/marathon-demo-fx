#{{{ Marathon
require_fixture 'default'
#}}} Marathon

name("Test Progress bar")
description("Assert Progress bar")
severity("normal")

def test

    with_window("Ensemble") {
        select("list", "true")
        click("list-view_1", "Controls")
        click("list-view_2", "Progress Bar")
        assert_p("progress-bar_3", "text", "0.25")
        assert_p("progress-bar_4", "text", "0.5")
        assert_p("progress-bar_5", "text", "1.0")
        assert_p("progress-bar_0", "text", "-1.0")
    }

end
