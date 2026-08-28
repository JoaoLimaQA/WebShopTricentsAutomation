*** Settings ***
Resource        ../../Resource/Base.resource
Resource        ../../Elements/Compras/Produtos.resource



*** Keywords ***
Seleciono produtos por categoria  
    [Arguments]    ${categoria}    ${produtos}    ${subcategoria}=None    ${index}=1

    ${escolher_categoria}=    Produtos.categorias    ${categoria}

    Click    ${escolher_categoria}        

    IF    '${subcategoria}' != 'None'
        ${escolher_subcategoria}=    Produtos.subcategorias    ${subcategoria}
            Click    ${escolher_subcategoria}    
    END

    ${escolher_produto}=    Produtos.selecionar_produto    ${produtos}    ${index}

    Click    ${escolher_produto}    