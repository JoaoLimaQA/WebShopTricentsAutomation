*** Settings ***
Resource      ../../Resource/Base.resource


Test Setup        Iniciar Sessão
Test Teardown     Take Screenshot

*** Test Cases ***
CD01 - Cadastrar Novos Usuarios    

    ${dados}     Get Fake Data    

    Dado que clico em Registrar
    Quando Insiro dados pessoais    Feminino    ${dados}[first_name]    ${dados}[last_name]    ${dados}[email]
    E Crio a senha    $dados[senha]
    Então clico em cadastrar
