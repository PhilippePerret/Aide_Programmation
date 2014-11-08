Pour pouvoir mettre le focus sur un élément quelconque, il suffit d'utiliser les `tabindex`.

Par exemple, sur des divs :

<div id="div1" tabindex="0"></div>
<div id="div2" tabindex="1"></div>
<div id="div3" tabindex="2"></div>

En plus de permettre de passer d'un élément à l'autre avec la touche TAB, cela permettra d'assigner des gestionnaires d'évènements propres à chaque élément.

Par exemple :

    $('div#div1').bind('keypress', $.proxy(this.key_on_div1, this))
    $('div#div2').bind('keypress', $.proxy(this.key_on_div2, this))
    $('div#div3').bind('keypress', $.proxy(this.key_on_div3, this))

-