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
        assertHTMLEditor()
    }
end


def assertHTMLEditor()
        # Find HTML Editor using driver.find_elements by css
        editors = driver.find_elements(:css, 'html-editor')
        # Find Editor with indexOfType = 0
        htmlEditor = editors.find{ |e| e['indexOfType'] == '0' }
        # Assert html_editor text
        assert_equals "<html dir=\"ltr\"><head></head><body contenteditable=\"true\">Lorem ipsum dolor sit amet, consectetur adipiscing elit.Nam tortor felis, pulvinar in scelerisque cursus, pulvinar at ante. Nulla consequat congue lectus in sodales.  </body></html>", htmlEditor.text
        # Find combobox using driver.find_element using combo-box with indexOfType
        comboBox2 = driver.find_element(:css, "combo-box[indexOfType = '2']")
        #Using marathon select call to set the value of the comboBox
        select("combo-box_2", "36 pt")
        # Assert the selected value.
        assert_equals "36 pt", comboBox2.text
        showBtn = driver.find_element(:css, "button[text = 'Show the HTML below']")
        showBtn.click
end
