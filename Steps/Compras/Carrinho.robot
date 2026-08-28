*** Settings ***
Resource        ../../Resource/Base.resource
Resource        ../../Elements/Compras/Detalhes_Produto.resource
Resource        ../../Elements/Compras/Carrinho.resource



*** Keywords ***
Adiciono ao carrinho
    [Arguments]         ${quantidade}=1      

    
    ${quantidade_itens}=        Detalhes_Produto.inserir_quantidade             ${quantidade}
    Click        ${tela_detalhes_produto.button_add_carrinho}          
    
    Get Text                        ${tela_login.text_add_carrinho_sucess}       
    Wait For Elements State         ${tela_login.text_add_carrinho_sucess}     visible

Acesso o carrinho

    Click     ${tela_carrinho.button_carrinho}


Validar produtos no carrinho
    [Arguments]    @{produtos}
    

    FOR    ${produto}    IN    @{produtos}
    ${validar_produtos}=        Carrinho.validar_produtos_carrinho    ${produto}

         Wait For Elements State    
         ...    ${validar_produtos}        
         ...    visible
    END
    

