*** Settings ***
Documentation   Home: Apply Promotional code testing
Library     SeleniumLibrary
Resource    ../keywords/bookTickets.robot

*** Test Cases ***
Scenario: Verify the discount percentage of the promotional code
    [Documentation]    This case should be test covered by unit test
    [Template]  Verify the discount percentage of the promotional code
    #departure  #return  #promotionalCode #expectedDiscount
    July  December (two years from now)    AF3-FJK-418    30%
    July  December (two years from now)    JJ5-OPQ-128    50%    
    July  December (two years from now)    AB7-OPQ-119    70%  

Scenario: Verify the final digit of the promotional code when the final digit is correct
    [Documentation]    This case should be test covered by unit test
    [Template]  Verify the final digit of the promotional code
    #departure  #return  #promotionalCode #expectedMessage
    July  December (two years from now)    AF3-FJK-418    Promotional code AF3-FJK-418 used: 30% discount!
    July  December (two years from now)    JJ6-OPQ-130    Promotional code JJ6-OPQ-130 used: 60% discount!    
    July  December (two years from now)    AB7-OPQ-153    Promotional code AB7-OPQ-153 used: 70% discount!    
    
  
Scenario: Verify the final digit of the promotional code when the final digit is incorrect
    [Documentation]    This case should be test covered by unit test
    [Template]  Verify the final digit of the promotional code
    #departure  #return  #promotionalCode #expectedMessage
    July  December (two years from now)    AF3-FJK-419    Sorry, code AF3-FJK-419 is not valid
    July  December (two years from now)    JJ6-OPQ-1310    Sorry, code JJ6-OPQ-1310 is not valid  


Scenario: User is unable to apply a promotion code when using an invalid promotional code
    [Documentation]    This case should be test covered by unit test
    [Template]  Verify the final digit of the promotional code
    #departure  #return  #promotionalCode #expectedMessage
    July  December (two years from now)    111-111-113    Sorry, code 111-111-113 is not valid
    July  December (two years from now)    AF3-FJK-4181111    Sorry, code AF3-FJK-4181111 is not valid  
    July  December (two years from now)    AF3-FJK-4110000   Sorry, code AF3-FJK-4110000 is not valid  
    July  December (two years from now)    4x   Sorry, code 4x is not valid  