*** Settings ***
Library         SeleniumLibrary
Documentation   Suite description #automated tests for scout website

*** Variables ***
${LOGIN URL}        https://scouts-test.futbolkolektyw.pl/en
${BROWSER}          Chrome
${SIGNINBUTTON}     xpath=//child::div/button
${EMAILINPUT}       xpath=//*[@id='login']
${PASSWORDINPUT}     xpath=//*[@id='password']
${PAGELOGO}     xpath=//*[@id="__next"]/div[1]/main/div[3]/div[1]/div/div[1]

*** Test Cases ***
Log in to the system
    Open login page
    Type in email
    Type in password
    Click on the Submit button
    Assert dashboard
    [Teardown] Close Browser

*** Keywords ***
Open login page
    Open Browser    ${LOGIN URL}   ${BROWSER}
    Title Should Be     Scouts panel - sign in
Type in email
    Input Text   ${EMAILINPUT}   user07@getnada.com
Type in password
    Input Text   ${PASSWORDINPUT}   user07@getnada.com
Click on the Submit button
    Click on the Element Is Visible     ${SIGNINBUTTON}
Assert dashboard
    Wait Until Element Is Visible   ${PAGELOGO}
    Title Should Be     Scouts panel
    Capture Page Screenshot     alert.png
