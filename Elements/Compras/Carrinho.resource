*** Variables ***

# ---------- CARRINHO ----------
&{tela_carrinho}

...       button_carrinho=//li[@id='topcartlink']//span[@class='cart-label']
...       button_update_cart=//input[@name="updatecart"]
...       text_carrinho_vazio=//div[@class="order-summary-content"]




*** Keywords ***

validar_produtos_carrinho
    [Arguments]    ${produtos}
    ${validar_produtos}=      Set Variable 
    ...            //td[@class='product']//a[@class="product-name" and contains(text(), "${produtos}")]  
    RETURN    ${validar_produtos}

remover_itens_carrinho
    [Arguments]    ${nome_produto}
    ${remover_produto}=     Set Variable    
    ...    //td[@class='product']//a[@class="product-name" and contains(text(), "${nome_produto}")]/ancestor::tr//input[@type='checkbox']
    RETURN    ${remover_produto}