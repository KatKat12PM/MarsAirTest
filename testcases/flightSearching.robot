*** Settings ***
Documentation   Home: Search flow with/without promotion testing
Library     SeleniumLibrary
Resource    ../keywords/bookTickets.robot

*** Test Cases ***
User is able to search for the ticket when the Seat is available (without promotional code)
    [Tags]    TC#1-001
    Given user opens the MarsAir site
    When user searches a ticket without promotion code with departure "July" and return "December (two years from now)"
    Then user must be able to search a ticket successfully
    [Teardown]  Close Browser

User is able to search for the ticket when the Seat is unavailable (without promotional code)
    [Tags]    TC#1-002
    Given user opens the MarsAir site
    When user searches a ticket without promotion code with departure "July" and return "July (next year)"
    Then the search result contains "Sorry, there are no more seats available."
    [Teardown]  Close Browser

User is able to apply a valid promotional code when the Seat is available
    [Tags]    TC#2-001
    Given user opens the MarsAir site
    When user searches a ticket with promotion code "AF3-FJK-418" and departure "July" and return "December (two years from now)" 
    Then user must be able to search a ticket successfully
    And the search result contains "Promotional code AF3-FJK-418 used: 30% discount!"
    [Teardown]  Close Browser

User is unable to apply a promotion code when the schedule is not possible
    [Tags]    TC#2-003
    Given user opens the MarsAir site
    When user searches a ticket with promotion code "AF3-FJK-418" and departure "July" and return "December" 
    Then the search result contains "Unfortunately, this schedule is not possible. Please try again."
    [Teardown]  Close Browser

User is unable to apply a promotion code when no more seats available 
    [Tags]    TC#2-004
    Given user opens the MarsAir site
    When user searches a ticket with promotion code "AF3-FJK-418" and departure "July" and return "July (next year)" 
    Then the search result contains "Sorry, there are no more seats available."
    [Teardown]  Close Browser

User is unable to apply a promotion code when the schedule is not possible
    [Tags]    TC#2-004
    Given user opens the MarsAir site
    When user searches a ticket without promotion code with departure "July" and return "December"
    Then the search result contains "Unfortunately, this schedule is not possible. Please try again"
    [Teardown]  Close Browser

Verify validate message when the user selects return date is less than 1 year from the departure
    [Tags]    TC#4-001
    Given user opens the MarsAir site
    When user searches a ticket without promotion code with departure "July (two years from now)" and return "December (two years from now)"
    Then the search result contains "Unfortunately, this schedule is not possible. Please try again."
    [Teardown]  Close Browser
    
User is able to search the flight when selecting a return date is equal to 1 year from the departure.
    [Tags]    TC#4-002
    Given user opens the MarsAir site
    When user searches a ticket without promotion code with departure "July" and return "July (next year)"
    Then the search result contains "Sorry, there are no more seats available."
    [Teardown]  Close Browser

User is able to search the flight when selecting a return date is Greater than 1 year from the departure.
    [Tags]    TC#4-002
    Given user opens the MarsAir site
    When user searches a ticket without promotion code with departure "July" and return "December (next year)"
    Then the search result contains "Sorry, there are no more seats available."
    [Teardown]  Close Browser

Verify the validation when the user select the return date same as the departure date
    [Tags]    TC#4-004
    Given user opens the MarsAir site
    When user searches a ticket without promotion code with departure "July (two years from now)" and return "July (two years from now)"
    Then the search result contains "Unfortunately, this schedule is not possible. Please try again."
    [Teardown]  Close Browser
