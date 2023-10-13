*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}                      https://www.infojobs.com.br/

${MENU_LOGIN}               https://www.infojobs.com.br/candidate/
${MENU_CURRICULO}           //a[contains(@title,'Currículo')]
${SUB_MENU_CARTA}           //a[contains(.,'Cartas de apresentação')] 
${CRIAR_CARTA}              //a[@class='jsMakeNewLetters js_MakeNewLetters criarCarta'][contains(.,'Criar nova Carta de Apresentação')]

${BOTAO_ACEITAR}            didomi-notice-agree-button
${BOTAO_ENTRAR}             //button[@class='btn btn-primary btn-block mb-15 js_loginButton'][contains(.,'Entrar')]
${BOTAO_GUARDAR}            //input[@type='submit'][contains(@id,'btnSave')]

${INPUT_EMAIL}              //input[contains(@type,'email')]
${INPUT_SENHA}              //input[contains(@placeholder,'Senha')]
${INPUT_NOME_CARTA}         //input[@name='ctl00$phMasterPage$cEdit$txtLetterName'][contains(@id,'txtLetterName')] 
${INPUT_TEXTO_CARTA}        //textarea[@name='ctl00$phMasterPage$cEdit$txtCandidateLetter'][contains(@id,'txtCandidateLetter')]  

${MENSAGEM_USUARIO}         //span[contains(@id,'Username-error')]
${MENSAGEM_SENHA}           //span[contains(@id,'Password-error')]
${MENSAGEM_SUCESSO}        //div[contains(@class,'alert alert-success ')]  

${USUARIO_OK}               glauciasonda@gmail.com
${SENHA}                    Teste123* 
${NOME_CARTA}               Carta para O Boticário 
${TEXTO_CARTA}              Oieeeee, eu sou a Gláucia!! :)  



*** Keywords ***
Abrir o navegador
    Open Browser    browser=chrome   options=add_experimental_option("detach", True) 

Fechar o navegador
    Close Browser

Acessar a home page do site Infojobs
    Go To    url=${URL}
    Wait Until Element Is Enabled    locator=${BOTAO_ACEITAR}
    Click Button    locator=${BOTAO_ACEITAR}

Acessar o menu de Login
    Click Link    locator=${MENU_LOGIN}

Informar dados de Login
    Input Text    locator=${INPUT_EMAIL}    text=${USUARIO_OK}
    Input Text    locator=${INPUT_SENHA}    text=${SENHA}
    
Submeter a transação de Login
    Click Button    locator=${BOTAO_ENTRAR}

Verificar mensagem de usuário logado: "${USUARIO_LOGADO}"
    Wait Until Element Is Visible    locator=${MENU_CURRICULO}
    Page Should Contain    text=${USUARIO_LOGADO}

Verificar mensagem de usuário: "${USUARIO_ERRO}"
    Wait Until Element Is Visible    locator=${MENSAGEM_USUARIO}
    Page Should Contain    text=${USUARIO_ERRO}

Verificar mensagem de senha: "${SENHA_ERRO}" 
    Wait Until Element Is Visible    locator=${MENSAGEM_SENHA}   
    Page Should Contain    text=${SENHA_ERRO}

Acessar o menu currículo
    Click Element    locator=${MENU_CURRICULO}

Verificar submenu "Cartas de Apresentação"
    Page Should Contain Element    locator=${SUB_MENU_CARTA}
    
Acessar submenu "Cartas de Apresentação"
    Click Link    locator=${SUB_MENU_CARTA}

Verificar seção "${TITULO_SECAO}"
    Page Should Contain    text=${TITULO_SECAO}

Acessar opção "Criar nova Carta de Apresentação"
    Click Element    locator=${CRIAR_CARTA}

Preencher campos com dados válidos
    Input Text    locator=${INPUT_NOME_CARTA}     text=${NOME_CARTA}
    Input Text    locator=${INPUT_TEXTO_CARTA}    text=${TEXTO_CARTA}

Submeter a transação de Guardar Carta
    Click Button    locator=${BOTAO_GUARDAR}

Verificar mensagem de sucesso
    Page Should Contain Element    locator=${MENSAGEM_SUCESSO}
    


    

    
    