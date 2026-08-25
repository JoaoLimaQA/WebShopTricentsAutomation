*** Settings ***
Resource        ../../Resource/Base.resource
Resource        ../../Elements/Compras/Produtos.resource



*** Keywords ***
Seleciono produtos por categoria  
    [Arguments]    ${categoria}    ${subcategoria}    ${produtos}    ${index}=1

    ${escolher_categoria} =         Produtos.categorias        ${categoria}
    Click    ${escolher_categoria}        timeout=5s
   
    ${escolher_subcategoria} =         Produtos.subcategorias    ${subcategoria}
    
    ${elemento_existe}=    Run Keyword And Return Status     ${escolher_subcategoria}    visible

    IF    ${elemento_existe} == ${True} 
          Click    ${escolher_subcategoria}     timeout=5s
    END
   
    ${escolher_produto} =             Produtos.selecionar_produto    ${produtos}    ${index}
    
    Click    ${escolher_produto}          timeout=5s