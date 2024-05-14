*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${BROWSER}  Chrome
${URL}  https://campusvirtual.ucc.edu.co/d2l/loginh/?logout=1
${USERNAME}  gabriela.rey
${PASSWORD}  Abcd1234!
${LOGIN_BUTTON_NAME}  Login
${USERNAME_FIELD_NAME}  userName
${PASSWORD_FIELD_NAME}  password
${EXPECTED_TEXT}  Mis cursos
${HOME_PAGE_XPATH}  /html/body/div/div[2]/div[2]/div/div/div[2]/div/div[1]/div/div/div[1]/h2

*** Test Cases ***
Gabriela Wants To Enter Her University Campus Page
    Open Browser And Navigate To Campus
    Entering The Information In The Login
    Validates The Label Of Entering Correctly
    [Teardown]  Close Browser

*** Keywords ***
Open Browser And Navigate To Campus
    Open Browser  ${URL}  ${BROWSER}
    Maximize Browser Window

Entering The Information In The Login
    Wait Until Element Is Visible  name:${USERNAME_FIELD_NAME}  10
    Input Text  name:${USERNAME_FIELD_NAME}  ${USERNAME}
    Input Text  name:${PASSWORD_FIELD_NAME}  ${PASSWORD}
    Click Element  name:${LOGIN_BUTTON_NAME}

Validates The Label Of Entering Correctly
    ${element_text}=  Get Text  xpath:${HOME_PAGE_XPATH}
    Should Be Equal As Strings  ${element_text}  ${EXPECTED_TEXT}
