*** Settings ***
Documentation   Keyword: Common keyword
Library     SeleniumLibrary
Variables   ../resources/env/${env}/config.yml
Resource    ../resources/pages/home.robot

*** Keywords ***
user opens the MarsAir site
    Open Browser    ${url}   ${browser}
    Maximize Browser Window
    Wait Until Element Is Visible   ${SEARCH_RESULT_TEXT} 

user closes the browser
    Close Browser