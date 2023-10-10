*** Settings ***
Documentation   Home: Book a ticket without promation code
Library     SeleniumLibrary
Resource    ../keywords/bookTickets.robot

*** Test Cases ***
User is able to search for the ticket when the Seat is available (without promotional code)
    Given user opens the MarsAir site
    When user searches a ticket without promotion code with departure "July" and return "December (two years from now)"
    Then user must be able to search a ticket successfully
    [Teardown]  Close Browser

User is able to search for the ticket when the Seat is unavailable (without promotional code)
    Given user opens the MarsAir site
    When user searches a ticket without promotion code with departure "July" and return "July (next year)"
    Then the search result contains "Sorry, there are no more seats available."
    [Teardown]  Close Browser

User is able to search for the ticket when the Seat is available (with promotional code)
    Given user opens the MarsAir site
    When user searches a ticket with promotion code "AF3-FJK-418" and departure "July" and return "December (two years from now)" 
    Then user must be able to search a ticket successfully
    And the search result contains "Promotional code AF3-FJK-418 used: 30% discount!"
    [Teardown]  Close Browser

User is able to search for the ticket when the Seat is unavailable (with promotional code)
    Given user opens the MarsAir site
    When user searches a ticket with promotion code "AF3-FJK-418" and departure "July" and return "July (next year)" 
    Then the search result contains "Sorry, there are no more seats available."
    [Teardown]  Close Browser


User is unable to apply a promotion code when the schedule is not possible
    Given user opens the MarsAir site
    When user searches a ticket without promotion code with departure "July" and return "December"
    Then the search result contains "Unfortunately, this schedule is not possible. Please try again"
    [Teardown]  Close Browser

User is able to search the flight when selecting a return date is equal to 1 year from the departure.
    Given user opens the MarsAir site
    When user searches a ticket without promotion code with departure "July" and return "July (next year)"
    Then the search result contains "Sorry, there are no more seats available."
    [Teardown]  Close Browser

User is able to search the flight when selecting a return date is Greater than 1 year from the departure.
    Given user opens the MarsAir site
    When user searches a ticket without promotion code with departure "July" and return "December (next year)"
    Then the search result contains "Sorry, there are no more seats available."
    [Teardown]  Close Browser
Verify validate message when the user selects return date is less than 1 year from the departure
    Given user opens the MarsAir site
    When user searches a ticket without promotion code with departure "July (two years from now)" and return "December (two years from now)"
    Then the search result contains "Unfortunately, this schedule is not possible. Please try again."
    [Teardown]  Close Browser

Verify the validation when the user select the return date same as the departure date
    Given user opens the MarsAir site
    When user searches a ticket without promotion code with departure "July (two years from now)" and return "July (two years from now)"
    Then the search result contains "Unfortunately, this schedule is not possible. Please try again."
    [Teardown]  Close Browser

User is able to click “Book a ticket to the red planet now!” to go to the home page
    Given user opens the MarsAir site
    When user clicks at the Book a ticket to the red planet now!
    Then the system must redirect to homepage
    [Teardown]  Close Browser

User is able to click MarsAir logo to go to the home page
    Given user opens the MarsAir site
    When user clicks search button
    And user clicks MarsAir logo
    Then the system must redirect to homepage
    [Teardown]  Close Browser