#{{{ Marathon
require_fixture 'default'
#}}} Marathon

name("Test Splitpane")
description("Assertting the split pane value")
severity("normal")

def test

    with_window("Ensemble") {
        select("list", "true")
        click("list-view_1", "Controls")
        click("list-view_2", "Hidden SplitPane")
        select("hiddenSplitter", "[0.2224622030237581,0.6598272138228942]")
        select("hiddenSplitter", "[0.2224622030237581,0.38444924406047515]")
        select("hiddenSplitter", "[0.30345572354211664,0.38444924406047515]")
        select("hiddenSplitter", "[0.30345572354211664,0.6501079913606912]")
        select("hiddenSplitter", "[0.1101511879049676,0.6501079913606912]")
        select("hiddenSplitter", "[0.1101511879049676,0.31317494600431967]")
        assert_p("hiddenSplitter", "text", "[0.1101511879049676,0.31317494600431967]")
        assert_p("hiddenSplitter", "text", "[0.1101511879049676,0.31317494600431967]")
    }

end
