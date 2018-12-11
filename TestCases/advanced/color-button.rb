#{{{ Marathon
require_fixture 'default'
#}}} Marathon

name("Test Color Button")
description("Assert button color")
severity("normal")

def test

    with_window("Ensemble") {
        select("list", "true")
        click("list-view_1", "Controls")
        click("list-view_2", "Button")
        click("list-view_3", "Colored Buttons")
        assertColorButtons()
    }
end

def assertColorButtons()
        
        # Using driver.find_elements to find all the buttons
        buttons = driver.find_elements(:css, 'button')
        redBtn = buttons.find {|b| b.text == 'Red' }
        # We can also find the button directly using driver.find_element by css
        assert_equals redBtn, driver.find_element(:css, 'button[text ="Red"]')
        # Click the button
        redBtn.click
        
        #Similarly we can find the button by the different properties of it
        # We will find the button 'Color' which has index of type 0
        color_1 = buttons.find{|b| b.text =='Color' && b['indexOfType'] == '0'}
        # We can also find the button as follows
        assert_equals color_1, driver.find_element(:css, 'button[text = "Color"][indexOfType = "0"]')
        
        blue_btn = driver.find_element(:css, 'button[text = "Blue"]')
        assert_equals "Blue", blue_btn.text

end
