
*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${URL}                         https://www.amazon.com.br/
${MENU_ELETRONICOS}            xpath=//*[@id="nav-xshop"]/ul/li[8]/div/a
${TEXTO_HEADER_ELETRONICOS}    text=Eletrônicos e Tecnologia
${HEADER_ELETRONICOS}          xpath=//span[contains(text(),'Eletrônicos e Tecnologia')][1]    



*** Keywords ***
Abrir o navegador
    #Open Browser   browser=chrome
    Open Browser   browser=chrome  options=add_experimental_option("detach", True)
    #Esse options detach serve para que o navegador nao feche automaticamente
    Maximize Browser Window

Fechar o navegador
    Capture Page Screenshot
    Close Browser


Dado que estou na home page da Amazon.com.br
    Go To                            ${URL}
    Sleep    15s 
    #Wait Until Element Is Visible    xpath=//*[@id="nav-xshop"]/ul/li[5]/div/a
    Wait Until Element Is Visible    ${MENU_ELETRONICOS}
    

Quando acessar o menu "Eletrônicos"
    Click Element    ${MENU_ELETRONICOS}


E o texto "Eletrônicos e Tecnologia" deve ser exibido na página
    Wait Until Page Contains          text=Eletrônicos e Tecnologia
    #Wait Until Page Contains        ${TEXTO_HEADER_ELETRONICOS}
    #Wait Until Element Is Visible    xpath=//span[contains(text(),'Eletrônicos e Tecnologia')][1]
    Wait Until Element Is Visible     ${HEADER_ELETRONICOS}


Então o título da página deve ficar "${TITULO}"  
    Title Should Be    title=${TITULO}


E a categoria "Computadores e Informática" deve ser exibida na página
    #Wait Until Element Is Visible    xpath=//*[@id="s-refinements"]/div[1]/ul/li[6]/span/a/span
    Element Should Be Visible    xpath=//*[@id="s-refinements"]/div[1]/ul/li[6]/span/a/span




Quando pesquisar pelo produto "Xbox Series S"
    #Input Text    xpath=//*[@id="twotabsearchtextbox"]    Xbox Series S
    Input Text    locator=twotabsearchtextbox    text=Xbox Series S
    Click Element    xpath=//*[@id="nav-search-submit-button"]

Entao o título da pagina deve ficar "Amazon.com.br : Xbox Series S"
    Title Should Be    title=Amazon.com.br : Xbox Series S  

E um produto da linha "Xbox Series S" deve ser mostrado na página
       Wait Until Element Is Visible     
       ...    xpath=//span[normalize-space()='Console Xbox Series S']