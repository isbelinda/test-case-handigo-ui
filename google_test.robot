*** Settings ***
Documentation    Suite description
Library         Selenium2Library

*** Variables ***
${BROWSER}      chrome


*** Keywords ***
Open Google Search Page
    open browser    https://www.google.com  ${BROWSER}

Search on Google
    input text      lst-ib      Fon phannida on medium
    press key       lst-ib      \\13                        # ASCII code for enter key

Wait for Search Results
    wait until page contains    Responses – Fon Phannida – Medium

Close Browser After Finish
    close browser


*** Test Cases ***
[1] Test Case: Search some keywords on Google search
    Given Open Google Search Page
    When Search on Google
    When Wait for Search Results
    Then Close Browser After Finish
