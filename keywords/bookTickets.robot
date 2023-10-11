*** Settings ***
Documentation   Keyword: Book a ticket
Library     SeleniumLibrary
Resource    ../resources/pages/home.robot
Resource    ../keywords/common.robot

*** Keywords ***
user searches a ticket without promotion code with departure "${departureMonth}" and return "${returnMonth}"
    Select From List By Label    ${DEPARTURE_DROPDOWN}  ${departureMonth}
    Select From List By Label    ${RETURN_DROPDOWN}  ${returnMonth}
    Click Button    ${SEARCH_BUTTON}
    Wait Until Element Contains   ${SEARCH_RESULT_TEXT}    Search Results    

user searches a ticket with promotion code "${promotionalCode}" and departure "${departureMonth}" and return "${returnMonth}" 
    Select From List By Label    ${DEPARTURE_DROPDOWN}  ${departureMonth}
    Select From List By Label    ${RETURN_DROPDOWN}  ${returnMonth}
    Input Text  ${PROMOTION_CODE_FIELD}     ${promotionalCode}
    Click Button    ${SEARCH_BUTTON}
    Wait Until Element Contains   ${SEARCH_RESULT_TEXT}    Search Results    

user must be able to search a ticket successfully
    Element Should Contain  ${SEARCH_RESULT_TEXT}     Seats available!    False
    Element Should Contain  ${SEARCH_RESULT_TEXT}     Call 0800 MARSAIR to book!   False

user must be able to search a ticket and search result is "${expectedSearchResult}"
    Element Should Contain  ${SEARCH_RESULT_TEXT}     ${expectedSearchResult}    False

the search result contains "${expectedSearchResult}"
    Element Should Contain  ${SEARCH_RESULT_TEXT}     ${expectedSearchResult}    False

Verify the discount percentage of the promotional code
    [Arguments]     ${departureMonth}  ${returnMonth}  ${promotionalCode}     ${expectedDiscount} 
    Given user opens the MarsAir site  
    When user searches a ticket with promotion code "${promotionalCode}" and departure "${departureMonth}" and return "${returnMonth}" 
    Then the search result contains "${promotionalCode}"
    And the search result contains "${expectedDiscount}"
    [Teardown]    Close Browser

Verify the final digit of the promotional code
    [Arguments]     ${departureMonth}  ${returnMonth}  ${promotionalCode}     ${expectedMessage} 
    Given user opens the MarsAir site  
    When user searches a ticket with promotion code "${promotionalCode}" and departure "${departureMonth}" and return "${returnMonth}" 
    And the search result contains "${expectedMessage}"
    [Teardown]    Close Browser

User clicks at the Book a ticket to the red planet now!
      Click Link    ${BOOK_A_TICKET_LINK}

user clicks search button
    Click Button    ${SEARCH_BUTTON}
    
user clicks MarsAir logo
    Click Element    ${MARS_AIR_LOGO}

The system must redirect to homepage
    Page Should Contain    Welcome to MarsAir!
    Page Should Contain    Book a ticket to the red planet now!