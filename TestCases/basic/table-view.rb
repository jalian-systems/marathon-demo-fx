#{{{ Marathon
require_fixture 'default'
#}}} Marathon

name("Test TableView")
description("Assert table cells in table view")
severity("normal")

def test

    with_window("Ensemble") {
        select("list", "true")
        click("list-view_1", "Controls")
        click("list-view_2", "TableView")
        click("table-view_0", "{\"cell\":[1,\"Last\"]}")
        click("table-view_0", "{\"cell\":[0,\"Last\"]}")
        click("table-view_0", "{\"cell\":[2,\"Last\"]}")
        assert_p("table-view_0", "text", "Fox", "{\"cell\":[2,\"Last\"]}")
        click("table-view_0", "{\"cell\":[4,\"Email\"]}")
        assert_p("table-view_0", "text", "mike.brown@example.com", "{\"cell\":[4,\"Email\"]}")
        click("table-view_0", "{\"cell\":[4,\"First\"]}")
        click("table-view_0", "{\"cell\":[1,\"Email\"]}")
        doubleclick("table-view_0", "{\"cell\":[1,\"Email\"]}")
        click("table-view_0", "{\"cell\":[0,\"Email\"]}")
    }

end
