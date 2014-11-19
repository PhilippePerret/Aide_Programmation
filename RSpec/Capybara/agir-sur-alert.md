#Agir sur une fenêtre alert ouverte par javascript

Le scenario doit certainement avec `js: true`

# Cliquer le bouton OK
page.driver.browser.switch_to.alert.accept

# Cliquer sur OK (?) mais en renvoyant faux (?) 
page.driver.browser.switch_to.alert.dismiss

#Obtenir le texte
page.driver.browser.switch_to.alert.text