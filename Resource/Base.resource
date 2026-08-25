*** Settings ***
Library            Browser
Library            libs/Gerador_dados.py


Resource           ../Steps/Cadastro/Cadastrar_Novos_Users.robot
Resource           ../Steps/Compras/Carrinho.robot
Resource           ../Steps/Compras/Produtos.robot
Resource           ../Steps/Compras/Detalhes_Produto.robot

Resource           ../Elements/Tela_Inicial/Tela_Inicial.resource



*** Keywords ***
Iniciar Sessão
    New Browser        browser=chromium    headless=False
    New Page           https://demowebshop.tricentis.com/


Realizo o login
    [Arguments]    ${email}    ${senha}

    Click            ${tela_login.button_logar}
    Fill Text        ${tela_login.input_email}          ${email}
    Fill Secret      ${tela_login.input_senha}           $senha

    Click    ${tela_login.button_input_login}
    
           

    IF    ${tela_login.text_erro_login} == $true   
          
          ${dados}     Get Fake Data 
          Dado que clico em Registrar
          Quando Insiro dados pessoais    Feminino    ${dados}[first_name]    ${dados}[last_name]    ${dados}[email]
          E Crio a senha    $dados[senha]
          Então clico em cadastrar
    END
    
    
    ${email_usuario} =         Tela_Inicial.user_logado     ${email}
    Validar Texto no Elemento        ${email_usuario}        ${email}


Validar Texto no Elemento
    [Arguments]   ${seletor}      ${mensagem_esperada}       ${timeout}=10
    [Documentation]    Aguarda elemento e compara texto
    
    Wait For Elements State    ${seletor}    visible    timeout=${timeout}

    ${mensagem_obtida}=    Get Text    ${seletor}
    IF    '${mensagem_obtida}' != '${mensagem_esperada}'
        Fail    ❌ Texto diferente! Esperado: "${mensagem_esperada}" | Obtido: "${mensagem_obtida}"
    END
    
    Log    ✅ Texto validado: "${mensagem_esperada}"
    
Pesquisar Produtos    
    [Arguments]    ${produtos}

    Fill Text    ${tela_inicial.input_pesquisa}        ${produtos}
    
    Press Keys     ENTER

Validar Notificacoes
    [Arguments]    ${texto_not_esperado}

    ${mensagem_not} =         Tela_Inicial.notificacoes        ${texto_not_esperado}
    
    Validar Texto no Elemento        ${mensagem_not}        ${texto_not_esperado}        timeout=3s