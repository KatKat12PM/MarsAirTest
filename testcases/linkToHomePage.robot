*** Settings ***
Documentation   Home: Link to Home Page Testing
Library     SeleniumLibrary
Resource    ../keywords/bookTickets.robot

*** Test Cases ***
User is able to click “Book a ticket to the red planet now!” to go to the home page
    [Tags]    TC#3-002
    Given user opens the MarsAir site
    When user clicks at the Book a ticket to the red planet now!
    Then the system must redirect to homepage
    [Teardown]  Close Browser

User is able to click MarsAir logo to go to the home page
    [Tags]    TC#3-003
    Given user opens the MarsAir site
    When user clicks search button
    And user clicks MarsAir logo
    Then the system must redirect to homepage
    [Teardown]  Close Browser