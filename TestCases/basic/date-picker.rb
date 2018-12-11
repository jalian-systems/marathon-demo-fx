#{{{ Marathon
require_fixture 'default'
#}}} Marathon

name("Test Date Picker")
description("Assert Date from Date Picker")
severity("normal")

def test

    with_window("Ensemble") {
        select("list", "true")
        click("list-view_1", "Controls")
        click("list-view_2", "DatePicker")
        select("date-picker_0", "18/12/2018")
        assert_p("date-picker_0", "text", "18/12/2018")
        select("date-picker_0", "25/11/2018")
        assert_p("date-picker_0", "text", "25/11/2018")
        assert_p("date-picker_0", "enabled", "true")
        select("date-picker_0", "25/11/2018")
        assert_p("Date:", "text", "Date:")
    }

end
