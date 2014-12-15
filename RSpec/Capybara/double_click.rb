# = Integration test =

element = page.find('select#icariens option[value="ancien@atelier-icare.net"]')
page.driver.browser.mouse.double_click(element.native)
