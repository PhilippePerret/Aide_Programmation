#Simuler une touche

(penser à mettre :js => true ?)

Pas sûr que ça fonctionne, pas testé correctement&nbsp;:

page.driver.browser.action.key_down(:return).key_up(:return)

:space