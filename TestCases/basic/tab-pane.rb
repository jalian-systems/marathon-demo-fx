#{{{ Marathon
require_fixture 'default'
#}}} Marathon

name("Test Tab-pane")
severity("normal")

def test

    with_window("Ensemble") {
        select("list", "true")
        click("list-view_1", "Controls")
        click("list-view_2", "TabPane")
        click("Toggle Tab Mode")
        click("Switch to New Tab")
        click("Howdy")
        select("tab-pane_0", "Testing::close")
        select("tab-pane_0", "Tab 1")
        click("Add Tab")
        select("tab-pane_0", "New Tab")
        select("tab-pane_0", "New Tab::close")
        select("tab-pane_0", "Longer Tab")
        select("ALL_TABS", "true")
        select("UNAVAILABLE", "true")
        select("SELECTED_TAB", "true")
        select("tab-pane_0", "Internal Tabs")
        select("tab-pane_1", "Tab 2")
        select("tab-pane_1", "Tab 3")
        select("tab-pane_1", "Tab 1")
        click("Toggle Tab Mode_2")
        click("Toggle Tab Position")
        select("tab-pane_0", "Tab 1")
        select("tab-pane_0", "Tab 3")
        select("tab-pane_0", "Tab 1")
        assert_p("tab-pane_0", "text", "Tab 1")
        assert_p("tab-pane_0", "enabled", "true")
    }

end
