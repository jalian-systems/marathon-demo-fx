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
        assertListView()
    }

end


def assertListView()
  with_window("Ensemble"){
    # select the rows from the list.
    listView = driver.find_element(:css ,"list-view")
    # Getting the list of all cell in the list view
    allCells = listView.find_elements(:css, ".::all-cells")
    # Getting the cell with text 'Long Row 3' and click it
    cell2 = allCells.find{ |c| c.text == "Long Row 3"}
    if cell2!=nil
      cell2.click
      # We can find the element by nth row also
      assert_equals cell2, driver.find_element(:css,  "list-view::nth-item(3)")
    end
    # You can select the list view item by driver.excute_script
    driver.execute_script('$1.getSelectionModel().select("Row 9");',listView)
  }
end
