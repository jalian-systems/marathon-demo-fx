#{{{ Marathon
require_fixture 'default'
#}}} Marathon

name("Test Dialogs")
description("Test Dialogs of different types")
severity("normal")

def test

    with_window("Ensemble") {
        select("list", "true")
        click("list-view_1", "Controls")
        click("list-view_2", "DialogApp")
        click("Create Alert")
    }

    with_window("Message") {
        click("OK")
    }

    with_window("Ensemble") {
        select("combo-box_0", "Warning")
        click("Create Alert")
    }

    with_window("Warning") {
        click("OK")
    }

    with_window("Ensemble") {
        click("Create Exception Dialog")
    }

    with_window("Program exception") {
        click("Show Details")
        click("OK")
    }

    with_window("Ensemble") {
        click("Create Text Input Dialog")
    }

    with_window("Text Input Dialog") {
        select("text-field_0", "Jalian Systems")
        click("OK")
    }

end
