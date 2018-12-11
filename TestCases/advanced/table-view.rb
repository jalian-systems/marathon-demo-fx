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
        assertTableView()
    }

end


def assertTableView()
  with_window("Ensemble"){
     # Find Table view web element by css
    tableViews = driver.find_elements(:css, 'table-view')

    # Find the table with index of 0
    tableView = tableViews.find { |t| t['indexOfType'] == '0'}

    # Can also find the element using the complete css path
    assert_equals tableView, driver.find_element(:css, "table-view[indexOfType='0']")

    # Get all table cells.
    tableCells = tableView.find_elements(:css, ".::all-cells")
    # Find the table cell with the row and column
    cell1 =  tableCells.find{ |c| c['row'] == '1' && c['column'] == 'Email'}
    # Click on the table cell
    cell1.click


    # You can assert the value of the table cell using driver.find_elemetns by css
    cell = tableCells.find{|c| c['row']=='2' && c['column'] == "Email"}
    # Get the attribute of the table cell and assert it.
    assert_equals "ethan.fox@example.com", cell['text']

  }
end

