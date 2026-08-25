*** Settings ***
Resource      ../../Resource/Base.resource


Test Setup        Iniciar Sessão
Test Teardown     Take Screenshot

*** Test Cases ***
CD01 - Adicionar produtos da mesma categoria no carrinho
    ${dados}    Get Fake Data

    Realizo o login    joaoteste@email.com   $dados[senha] 
    Seleciono produtos por categoria    Eletronics    Cell phones    Smartphone        
    Adiciono ao carrinho         The product has been added to your
    Seleciono produtos por categoria    Eletronics    Cell phones    Smartphone        
    Adiciono ao carrinho         The product has been added to your
    Acesso o carrinho
    Validar produtos no carrinho