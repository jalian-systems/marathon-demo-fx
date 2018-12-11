#{{{ Marathon
require_fixture 'default'
#}}} Marathon

name("Test List View")
description("Test List view and assert the list view cells")
severity("normal")

def test

    with_window("Ensemble") {
        select("list", "true")
        click("list-view_1", "Controls")
        click("list-view_2", "Listview")
        click("list-view_3", "Simple ListView")
        click("list-view_0", "Row 1")
        click("list-view_0", "Long Row 3")
        assert_p("list-view_0", "text", "Long Row 3", "Long Row 3")
        click("list-view_0", "Row 14")
        select("list-view_0", "[\"Row 9\",\"Row 14\"]")
    }

end
