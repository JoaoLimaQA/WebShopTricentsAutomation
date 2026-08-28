*** Variables ***    

# ---------- TELA LOGIN ----------
&{tela_login}

...    button_logar=//a[contains(text(),"Log in")]
...    input_email=//input[@id="Email"]
...    input_senha=//input[@id="Password"]
...    button_input_login=//input[@type="submit" and contains(@value, "Log in")]
...    text_erro_login=//div[@class="form-fields"]//div//div//li
...    text_add_carrinho_sucess=//div[@id="bar-notification"]/p[@class="content"]

# ---------- TELA INICIAL ----------

&{tela_inicial}

...    input_pesquisa=//input[@id="small-searchterms"]
...    notificacoes=//div[@id="bar-notification"]


*** Keywords ***
user_logado
    [Arguments]    ${usuario}
     ${layout_usuario}    Set Variable         
     ...     //a[@class="account" and contains(text(), "${usuario}")]
    RETURN   ${layout_usuario}

notificacoes
    [Arguments]    ${texto_notificado}
    ${notificacao}     Set Variable       
    ...    //div[@id="bar-notification"]/p[contains(normalize-space(text()), "${texto_notificado} ")]
    RETURN   ${notificacao}