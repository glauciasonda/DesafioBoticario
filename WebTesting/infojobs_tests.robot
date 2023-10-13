*** Settings ***
Documentation    Esta suíete executa os testes no site https://www.infojobs.com.br
Resource         infojobs_resources.robot
Test Setup       Abrir o navegador
#Test Teardown    Fechar o navegador

*** Test Cases ***
Caso de Teste 01 - Login com Sucesso
    [Documentation]    Este caso de teste executa o "caminho feliz"  para a inclusão de uma "Carta de Apresentação" no site Infojobs. 
    [Tags]             Login    Sucesso     
    
    Acessar a home page do site Infojobs
    Acessar o menu de Login
    Informar dados de Login
    Submeter a transação de Login
    Verificar mensagem de usuário logado: "Olá, Gláucia"
    Acessar o menu currículo
    Verificar submenu "Cartas de Apresentação"
    Acessar submenu "Cartas de Apresentação"
    Verificar seção "Gestão de Cartas de Apresentação"
    Acessar opção "Criar nova Carta de Apresentação"
    Preencher campos com dados válidos
    Submeter a transação de Guardar Carta 
    Verificar mensagem de sucesso


Caso de Teste 02 - Falha no Login
    [Documentation]     Este teste caso de teste é responsável pela validação das mensagens de falha ao submeter a transação de Login sem  informar os dados. 
    [Tags]              Login    Falha   

    Acessar a home page do site Infojobs
    Acessar o menu de Login
    Submeter a transação de Login
    Verificar mensagem de usuário: "O usuário é obrigatório"
    Verificar mensagem de senha: "A senha é obrigatória"

