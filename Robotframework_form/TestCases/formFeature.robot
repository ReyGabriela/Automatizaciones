*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${browser}  chrome
${url}  https://forms.office.com/Pages/ResponsePage.aspx?id=boM2jXVr5k26uV9LF3VCfzhlh2dL3U1Kj3Q574guY0NUN1pCNVAyVDhSSkRGTzVVSEtOVUkyWEMyMi4u

*** Test Cases ***
Completar el form de google
    Abrir Navegador
    Llenar el form
    Cerrar Navegador

*** Keywords ***
Abrir Navegador
    Open Browser    ${url}    ${browser}

Llenar el form
    [Documentation]    Como usuario, quiero poder iniciar sesión en el Campus Virtual de la Universidad para acceder a los recursos y cursos.
    Input Text    xpath:/html/body/div/div/div[1]/div/div/div[3]/div/div/div[2]/div[1]/div[1]/div[2]/div/span/input    gabriela.rey
    Input Text    xpath:/html/body/div/div/div[1]/div/div/div[3]/div/div/div[2]/div[1]/div[2]/div[2]/div/span/input   Abcd1234!
    Input Text    xpath:/html/body/div/div/div[1]/div/div/div[3]/div/div/div[2]/div[1]/div[3]/div[2]/div/span/input  Abcd1234!
    Click Element    xpath:/html/body/div/div/div[1]/div/div/div[3]/div/div/div[2]/div[1]/div[4]/div[2]/div/div/div[1]/div/label/span[1]/input
    Click Element    xpath:/html/body/div/div/div[1]/div/div/div[3]/div/div/div[2]/div[1]/div[5]/div[2]/div/div/div[1]/div/label/span[1]/input
    Click Element    xpath:/html/body/div/div/div[1]/div/div/div[3]/div/div/div[2]/div[1]/div[6]/div[2]/div/div/div[9]/div/label/span[1]/input
    Click Element    xpath:/html/body/div/div/div[1]/div/div/div[3]/div/div/div[2]/div[1]/div[7]/div[2]/div/div/div[9]/div/label/span[1]/input

    Click Element    xpath://*[@id='question-list']/div[8]/div[2]/div/div/div[3]/span
    Click Element    xpath://*[@id='question-list']/div[9]/div[2]/div/div/div[4]/span
    Click Element    xpath:/html/body/div/div/div[1]/div/div/div[3]/div/div/div[2]/div[1]/div[10]/div[2]/div/div/div[3]/span
    Click Element    xpath://*[@id='question-list']/div[11]/div[2]/div/div/div[3]/span
    Click Element    xpath://*[@id='question-list']/div[12]/div[2]/div/span/input
    Click Element    xpath://*[@id='question-list']/div[13]/div[2]/div/div/div[3]/span
    Click Element    xpath://*[@id='form-main-content1']/div/div/div[2]/div[2]/div/button

Cerrar Navegador
    Close browser





