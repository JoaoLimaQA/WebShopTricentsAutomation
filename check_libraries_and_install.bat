@echo off
setlocal

:: Defina o tipo de instalacao desejada
echo ESCOLHA UMA OPCAO DE INSTALACAO PARA OS PACOTES/BIBLIOTECAS:
echo 0 - SAIR
echo 1 - PARA INSTALAR AS VERSOES UTILIZADAS EM NOSSO PROJETO
echo 2 - PARA INSTALAR A ULTIMA VERSAO DISPONIVEL DE CADA PACOTE*
echo       *SOLICITACAO DEVE PARTIR DA ARQUITETURA
echo 3 - REMOVER TODAS AS BIBLIOTECAS INSTALADAS LOCALMENTE
echo DIGITE E TECLE ENTER ...
set /p opcao=

if "%opcao%"=="0" (
    echo SAINDO ...
    timeout /t 1 >nul
    exit
) else if "%opcao%"=="1" (
    set "opcao="
    :: Defina o caminho para o arquivo de pacotes com as versoes utilizadas no projeto
    set "PACKAGES=requirements_project.txt"
) else if "%opcao%"=="2" (
    set "opcao="
    :: Defina o caminho para o arquivo de pacotes com as versoes mais recentes
    set "PACKAGES=requirements.txt"
) else if "%opcao%"=="3" (
    echo REMOVENDO TODAS AS BIBLIOTECAS INSTALADAS LOCALMENTE ...
    for /f "delims=" %%i in ('pip freeze') do pip uninstall -y %%i
    echo TODAS AS BIBLIOTECAS FORAM REMOVIDAS.
    pause
    exit
) else (
    echo OPCAO INVALIDA. TENTE NOVAMENTE !
    timeout /t 1 >nul
    goto menu
)

:: Verifica se o arquivo de pacotes existe
if not exist "%PACKAGES%" (
    echo O ARQUIVO DE PACOTES "%PACKAGES%" NAO FOI ENCONTRADO.
    echo VERIFIQUE O CAMINHO E TENTE NOVAMENTE.
    pause
    exit /b 1
)

:: Exibe uma mensagem informando o início da instalação
echo ################################################################
echo # INICIANDO O PROCESSO DE INSTALACAO DOS PACOTES E BIBLIOTECAS #
echo ################################################################

:: Lê o arquivo linha por linha e instala cada pacote
for /f "delims=" %%p in (%PACKAGES%) do (
    if "%%p" neq "" (
        echo INSTALANDO O PACOTE: %%p ...
        echo -------------------
        echo POR FAVOR, AGUARDE!
        pip install %%p >nul 2>&1

        :: Verifica se o pip install foi bem-sucedido e exibe a mensagem correspondente
        if %ERRORLEVEL% equ 0 (
            echo -------------------------------------------------------------------------------------
         echo O PACOTE %%p FOI INSTALADO COM SUCESSO OU JA ESTA NA VERSAO SOLICITADA.
         echo -------------------------------------------------------------------------------------
        ) else (
            echo ----------------------------------------------
	    echo HOUVE UM ERRO AO TENTAR INSTALAR O PACOTE: %%p !
	    echo NESTE CASO, SUGERE-SE INSTALAR MANUALMENTE COM O PIP INSTALL PARA VERIFICAR OS LOGS.
        echo ----------------------------------------------
        )
    )
)

:: Mensagem de conclusão
echo ##########################################
echo # O PROCESSO DE INSTALACAO FOI CONCLUIDO #
echo ##########################################
pause