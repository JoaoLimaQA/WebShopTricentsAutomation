*** Variables ***

# ---------- CARRINHO ----------
&{tela_carrinho}

...       button_carrinho=//li[@id='topcartlink']//span[@class='cart-label']




*** Keywords ***

validar_produtos_carrinho
    [Arguments]    ${produtos}
    ${validar_produtos}=      Set Variable 
    ...            //td[@class='product']//a[@class="product-name" and contains(text(), "${produtos}")]  
    RETURN    ${validar_produtos}