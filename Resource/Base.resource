*** Settings ***
Library            Browser
Library            libs/Gerador_dados.py


Resource           ../Steps/Cadastro/Cadastrar_Novos_Users.robot
Resource           ../Steps/Compras/Carrinho.robot
Resource           ../Steps/Compras/Produtos.robot
Resource           ../Steps/Compras/Detalhes_Produto.robot

Resource           ../Elements/Tela_Inicial/Tela_Inicial.resource

#Em Nem Browser o args faz com o navegador abra no monitor a direita. 
#Caso necessite que abra a esquerda coloque args=["--window-position=-1920,0"]
#Caso tenha apenas um monitor coloque  args=["--window-position=0,0"]

*** Keywords ***
Iniciar Sessão
    New Browser        browser=chromium    headless=False   args=["--window-position=1920,0"]
    New Page           https://demowebshop.tricentis.com/

Realizo o login
    [Arguments]    ${email}    ${senha}

    Click              ${tela_login.button_logar}
    Fill Text          ${tela_login.input_email}          ${email}
    Fill Text        ${tela_login.input_senha}          ${senha}

    Click    ${tela_login.button_input_login}
    Validar Resultado Do Login    ${email}



Validar Resultado Do Login
    [Arguments]    ${email}
    
    ${usuario}=     Tela_Inicial.user_logado    ${email}

    ${login_sucesso}=    Run Keyword And Return Status
    ...    Wait For Elements State
    ...    ${usuario}
    ...    visible
    ...    timeout=3s

    IF    ${login_sucesso}
        RETURN    SUCESSO
    END

    ${login_erro}=    Run Keyword And Return Status
    ...    Wait For Elements State
    ...    ${tela_login.text_erro_login}
    ...    visible
    ...    timeout=3s

    IF    ${login_erro}
        RETURN    ERRO
    END

    Fail    Não foi possível identificar o resultado do login.
    ...    Nenhum elemento de sucesso ou erro foi encontrado.

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
    
    Validar Texto no Elemento        ${mensagem_not}        ${texto_not_esperado}        timeout=10s