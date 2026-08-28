*** Settings ***
Resource        ../../Resource/Base.resource
Resource        ../../Elements/Compras/Detalhes_Produto.resource
Resource        ../../Elements/Compras/Carrinho.resource



*** Keywords ***
Adiciono ao carrinho
    [Arguments]         ${quantidade}      

    
    Fill Text        ${tela_detalhes_produto.input_quantidade}          ${quantidade}
    Click            ${tela_detalhes_produto.button_add_carrinho}          
    
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
    
Remover itens do carrinho
    [Arguments]    @{itens}


    FOR    ${iten}    IN    @{itens}
        ${remover_itens} =     Carrinho.remover_itens_carrinho    ${iten}  

        Wait For Elements State     
        ...    ${remover_itens}   
        ...     visible
        Click     ${remover_itens}
    END

    Click    ${tela_carrinho.button_update_cart}

    Validar Texto no Elemento    ${tela_carrinho.text_carrinho_vazio}    Your Shopping Cart is empty!
        
Continuo comprando
    
    Click    ${tela_carrinho.button_continue_shop}