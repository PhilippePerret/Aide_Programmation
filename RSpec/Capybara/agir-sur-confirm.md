#Agir sur une fenêtre confirm ouverte par javascript


# Cliquer le bouton OK
page.driver.browser.switch_to.alert.accept  # c'est bien 'alert', mais pour un confirm

# Cliquer sur cancel
page.driver.browser.switch_to.alert.dismiss

#Obtenir le texte
page.driver.browser.switch_to.alert.text