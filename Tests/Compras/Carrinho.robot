*** Settings ***
Resource      ../../Resource/Base.resource


Test Setup        Iniciar Sessão
Test Teardown     Take Screenshot

*** Test Cases ***
CD01 - Adicionar produtos da mesma categoria no carrinho
    ${dados}    Get Fake Data

    Realizo o login    joaoteste@email.com   ${dados}[senha] 
    Seleciono produtos por categoria    Electronics    Smartphone     Cell phones        
    Adiciono ao carrinho         
    Seleciono produtos por categoria    Books       Computing and Internet        
    Adiciono ao carrinho            3
    Acesso o carrinho
    Validar produtos no carrinho    Smartphone    Computing and Internet