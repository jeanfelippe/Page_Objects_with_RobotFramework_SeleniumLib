
*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${STATUS}        ${1}


*** Test Cases ***
Exemplo Bloco IF Eletrônicos
    IF    ${STATUS} > 0
        Log To Console    Status é maior que 0
    ELSE
        Log To Console    Status é menor que 0
        
    END