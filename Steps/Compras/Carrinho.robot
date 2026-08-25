*** Settings ***
Resource        ../../Resource/Base.resource
Resource        ../../Elements/Compras/Detalhes_Produto.resource



*** Keywords ***
Adiciono ao carrinho
    [Arguments]      ${txt_notificao}    ${quantidade}=1      

    Fill Text    ${tela_detalhes_produto.input_quantidade}               ${quantidade}
    Click        ${tela_detalhes_produto.button_add_carrinho}           timeout=5s
    
    Validar Notificacoes    ${txt_notificao}