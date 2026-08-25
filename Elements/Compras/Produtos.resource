*** Variables ***

*** Keywords ***
categorias
   [Arguments]    ${tipo_categoria}
   ${categoria}    Set Variable    
   ...    //div[@class="block block-category-navigation"]//div[@class="listbox"]//li//a[contains(text(), "${tipo_categoria}")]
   RETURN    ${categoria}

subcategorias
    [Arguments]    ${tipo_subcategoria}  
    ${subcategoria}    Set Variable   
    ...     //div[@class="sub-category-grid"]//div[@class="sub-category-item"]//div//a[contains(@href, "${tipo_subcategoria}")]
    RETURN    ${subcategoria}

selecionar_produto
    [Arguments]    ${produto}    ${index}
    ${selec_produto}    Set Variable    
    ...    (//div[@class="product-grid"]//div[2]//h2//a[contains(text(), "${produto}")])[${index}]
    RETURN    ${selec_produto}