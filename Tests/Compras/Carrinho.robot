*** Settings ***
Resource      ../../Resource/Base.resource


Test Setup        Iniciar Sessão
Test Teardown     Take Screenshot

*** Test Cases ***
CD01 - Adicionar itens de categorias diferentes no carrinho
    ${dados}    Get Fake Data

    Realizo o login    joaoteste@email.com   ${dados}[senha] 
    Seleciono produtos por categoria    Electronics    Smartphone     Cell phones        
    Adiciono ao carrinho     1    
    Seleciono produtos por categoria    Books       Computing and Internet        
    Adiciono ao carrinho            3
    Acesso o carrinho
    Validar produtos no carrinho    Smartphone    Computing and Internet

CD02 - Remover itens do carrinho
    ${dados}    Get Fake Data

    Realizo o login    joaoteste@email.com   ${dados}[senha] 
    Seleciono produtos por categoria    Electronics    Smartphone     Cell phones        
    Adiciono ao carrinho        1 
    Seleciono produtos por categoria    Books       Computing and Internet        
    Adiciono ao carrinho            3
    Acesso o carrinho
    Remover itens do carrinho    Smartphone    Computing and Internet