#{{{ Marathon
require_fixture 'default'
#}}} Marathon

name("Test Progress bar")
description("Assert Progress bar")
severity("normal")

def test

    with_window("Ensemble") {
        select("list", "true")
        click("list-view_1", "Controls")
        click("list-view_2", "Progress Bar")
        assertProgressBar()
    }

end
def assertProgressBar()
        # Find progress bar using css path from driver.find_elements
        pBars = driver.find_elements(:css, 'progress-bar')
        # Get the pBar with indexOfType property
        pBar_3 = pBars.find {|p| p['indexOfType'] == "3" }
        # We can also find the element by passing full css path
        assert_equals pBar_3, driver.find_element(:css, 'progress-bar[indexOfType = "3"]')
        # Assert the initial value of the progressBar
        assert_equals "0.25", pBar_3.text
        # Using driver.execute_script setting the value of the progress bar
        driver.execute_script('$1.setProgress(0.55);', pBar_3);
        # Assert the custom value set to the progressbar
        assert_equals "0.55", pBar_3.text
        
        # Setting the progess bar in intermidiate state using driver.execute_script
        driver.execute_script('$1.setProgress(-1.0);', pBar_3)
        # Assert the state of the progessbar
        assert_equals "true", pBar_3['component.indeterminate']
        # Asserting the other progress bars using marathon commands
        assert_p("progress-bar_4", "text", "0.5")
        assert_p("progress-bar_5", "text", "1.0")
        assert_p("progress-bar_0", "text", "-1.0")
end
