*** Settings ***
Resource        ../../Resource/Base.resource
Resource        ../../Elements/Cadastro/Cadastrar_Novos_Users.resource


*** Keywords ***
Dado que clico em Registrar
    
    Click   ${tela_cadastro.button_registrar}   

Quando Insiro dados pessoais  
    [Arguments]    ${genero}    ${nome}    ${sobrenome}    ${email} 

    IF    '${genero}' == 'Masculino'
        
        Click    ${tela_cadastro.input_male}  
    
    ELSE IF    '${genero}' == 'Feminino'    

        Click    ${tela_cadastro.input_female}

    ELSE
        ${mensagem_erro}=    Set Variable    ERRO: O valor "${genero}" é inválido! Valores permitidos: 'Masculino' para Male ou 'Feminino' para Famale.
        Log    ${mensagem_erro}    level=ERROR
        Fail    ${mensagem_erro}
        
    END

    Fill Text    ${tela_cadastro.input_first_name}    ${nome}
    Fill Text    ${tela_cadastro.input_last_name}     ${sobrenome}
    Fill Text    ${tela_cadastro.input_email}         ${email}

E Crio a senha
    [Arguments]     ${senha}

    Fill Secret    ${tela_cadastro.input_senha}            $senha
    Fill Secret    ${tela_cadastro.input_conf_senha}       $senha

Então clico em cadastrar  

    Click    ${tela_cadastro.button_input_registrar} 