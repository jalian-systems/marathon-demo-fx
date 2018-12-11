#{{{ Marathon
require_fixture 'default'
#}}} Marathon

name("Test Spinner ")
description("Test Spinner ")
severity("normal")

def test

        with_window("Ensemble") {
        select("list", "true")
        click("list-view_1", "Controls")
        click("list-view_2", "SpinnerApp")
        select("spinner_0", "2")
        assert_p("spinner_14", "text", "Grace")
        select("spinner_15", "Matt")
        assert_p("spinner_15", "text", "Matt")
        select("spinner_15", "Matt")
        select("spinner_10", "0.51")
        assert_p("spinner_10", "text", "0.51")
        assert_p("spinner_9", "enabled", "true")
    }


end
