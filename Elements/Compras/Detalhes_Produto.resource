*** Variables ***

# ---------- OVERVIEW DO PEDIDO ----------
&{tela_detalhes_produto}

...       button_add_carrinho=//div[@class="overview"]//input[@type="button" and @value="Add to cart"]
...       input_quantidade=//input[@class="qty-input"]




*** Keywords ***
preco_produto
    [Arguments]    ${preco}
    ${preco_unitario} =     Set Variable    
    ...    //div[@class="product-price"]//span[contains(text(), "${preco}")]
    RETURN     ${preco_unitario}
