*** Settings ***
Library    SeleniumLibrary
Library    Process

*** Variables ***
${URL}                           https://bugbank.netlify.app/
${EMAIL_CADASTRO}                xpath = /html/body/div/div/div[2]/div/div[2]/form/div[2]/input
${EMAIL_LOGIN}                   xpath = /html/body/div/div/div[2]/div/div[1]/form/div[1]/input
${NOME}                          xpath = /html/body/div/div/div[2]/div/div[2]/form/div[3]/input
${SENHA_CADASTRO}                xpath = /html/body/div/div/div[2]/div/div[2]/form/div[4]/div/input
${SENHA_LOGIN}                   xpath = /html/body/div/div/div[2]/div/div[1]/form/div[2]/div/input
${CONFIRMAÇÃO_SENHA}             xpath = /html/body/div/div/div[2]/div/div[2]/form/div[5]/div/input
${BUTTON_REGISTRAR}              xpath = /html/body/div/div/div[2]/div/div[1]/form/div[3]/button[2]
${BUTTON_CADASTRAR}              xpath = /html/body/div/div/div[2]/div/div[2]/form/button
${BUTTON_AFTER_CADASTRAR}        xpath = /html/body/div/div/div[3]/div/div[2]/a
${BUTTON_LOGIN}                  xpath = /html/body/div/div/div[2]/div/div[1]/form/div[3]/button[1]
${BUTTON_LOGOUT}                  xpath = /html/body/div/div/div[1]/div/a


*** Keywords ***
Given the user access the website
    Open Browser    ${URL}    chrome
    Maximize Browser Window
And clicks on the register button
    Click Element    ${BUTTON_REGISTRAR}
And puts all the correct information
    Wait Until Page Contains                     Cadastrar 
    Input Text       ${NOME}                     User Test
    Input Text       ${EMAIL_CADASTRO}           murilo.test10@testing.com
    Input Text       ${SENHA_CADASTRO}           TestePassword2309
    Input Text       ${CONFIRMAÇÃO_SENHA}        TestePassword2309
    Sleep    1
    Click Element    ${BUTTON_CADASTRAR}   
    Sleep    3
Then their registration will be completed successfully
    Click Element    ${BUTTON_AFTER_CADASTRAR} 

    
Given the user access the login page 
    Wait Until Element Is Visible    ${BUTTON_LOGIN}
And puts their correct login information
    Input Text       ${EMAIL_LOGIN}              murilo.test10@testing.com
    Input Text       ${SENHA_LOGIN}              TestePassword2309
Then they'll be able to log into the website
    Click Element    ${BUTTON_LOGIN}
    Sleep    5


Given the user is logged into the website
    Wait Until Element Is Visible    ${BUTTON_LOGOUT}
And they try to log out of the application
    Click Element    ${BUTTON_LOGOUT}
Then they'll be back at the login page
    Wait Until Element Is Visible    ${BUTTON_LOGIN}
    Sleep    3
    Close Browser

*** Test Cases ***
Test 1: Registration 
    Given the user access the website
    And clicks on the register button
    And puts all the correct information
    Then their registration will be completed successfully

Test 2: Login
    Given the user access the login page
    And puts their correct login information
    Then they'll be able to log into the website

Test 3: Logout
    Given the user is logged into the website
    And they try to log out of the application
    Then they'll be back at the login page