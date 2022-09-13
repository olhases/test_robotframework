*** Settings ***
Library         SeleniumLibrary
Documentation   Suite description #automated tests for scout website

*** Variables ***
${LOGIN URL}        https://scouts.futbolkolektyw.pl/en/
${REMINDPASSWORD URL}
${BROWSER}          Chrome
${SIGNINBUTTON}     xpath=//child::div/button
${EMAILINPUT}       xpath=//*[@id='login']
${PASSWORDINPUT}     xpath=//*[@id='password']
${PAGELOGO}     xpath=//*[@id="__next"]/div[1]/main/div[3]/div[1]/div/div[1]
${LANUAGECHANGEBUTTON}       xpath=//div[@role='button']
${POLSKIBUTTON}     xpath=//li[normalize-space()='Polski']

${SIGNOUTBUTTON}        xpath=(//div[@role='button'])[4]

${REMINDPASSWORDBUTTON}     xpath=//child::div/a
${EMAILFIELD}       xpath=//input[@name='email']
${SENDBUTTON}       xpath=//button[@type='submit']

${LANGUAGEBUTTON}       xpath=(//div[@role='button'])[3]

${ADDPLAYERBUTTON}      xpath=//span[normalize-space()='Add player']
${NAMEFIELD}        xpath=//input[@name='name']
${SURNAMEFIELD}     xpath=//input[@name='surname']
${AGEFIELD}     xpath=//input[@name='age']
${MAINPOSITIONFIELD}        xpath=//input[@name='mainPosition']
${SUBMITPLAYERBUTTON}       xpath=//button[@type='submit']
${ADDPLAYERTITLE}       xpath=(//span[@class='MuiTypography-root MuiCardHeader-title MuiTypography-h5 MuiTypography-displayBlock'])[1]

${MATCHESBUTTON}        xpath=(//div[@role='button'])[4]
${SEARCHFIELD}      xpath=//input[@placeholder='Search…']

${CARDOFPLAYER}     xpath=//*[@id="MUIDataTableBodyRow-0"]/td[2]
${ADDMATCHBUTTON}       xpath=(//button[@class='MuiButtonBase-root MuiButton-root MuiButton-text jss34'])[1]
${MYTEAMFIELD}      xpath=//input[@name='myTeam']
${ENEMYTEAMFIELD}       xpath=//input[@name='myTeamScore']
${MYTEAMSCOREFIELD}     xpath=//input[@name='enemyTeam']
${ENEMYTEAMSCOREFIELD}      xpath=//input[@name='enemyTeamScore']
${DATEFIELD}        xpath=//input[@name='date']
${MATCHOUTHOMERADIO}        xpath=//input[@value='false']
${SUBMITMATCHESBUTTON}      xpath=//button[@type='submit']

*** Test Cases ***
Log in to the system
    Open login page
    Type in email
    Type in password
    Click on the Submit button
    Assert dashboard
    [Teardown]      Close Browser

Changing language
    Open login page
    Click on the Language change button
    Click on the Polski button
    [Teardown]      Close Browser

Sign out of the system
    Open login page
    Type in email
    Type in password
    Click on the Submit button
    Assert dashboard
    Click on the Signout button
    [Teardown]      Close Browser

Changing language on the page
    Open login page
    Type in email
    Type in password
    Click on the Submit button
    Assert dashboard
    Click on the Language button
    [Teardown]      Close Browser

Remind password
    Open login page
    Click on the Remind password button
    Type in email field
    Click on the Send button
    [Teardown]      Close Browser

Add player
    Open login page
    Type in email
    Type in password
    Click on the Submit button
    Assert dashboard
    Click on the Add player button
    Assert add player page
    Type in Name
    Type in Surname
    Type in Age
    Type in Main position
    Click on the Submit player button
    [Teardown]      Close Browser

*** Keywords ***
Open login page
    Open Browser    ${LOGIN URL}   ${BROWSER}
    Title Should Be     Scouts panel - sign in
Type in email
    Input Text   ${EMAILINPUT}   user07@getnada.com
Type in password
    Input Text   ${PASSWORDINPUT}   Test-1234
Click on the Submit button
    Click Element     xpath=//child::div/button
Click on the Language change button
    Click Element       xpath=//div[@role='button']
Click on the Polski button
    Click Element       xpath=//li[normalize-space()='Polski']
Click on the Signout button
    Click Element       xpath=(//div[@role='button'])[4]
Click on the Language button
    Click Element       xpath=(//div[@role='button'])[3]
Click on the Remind password button
    Click Element       xpath=//child::div/a
Type in email field
    Input Text   ${EMAILFIELD}      user07@getnada.com
Click on the Send button
    Click Element       xpath=//button[@type='submit']
Click on the Add player button
    Click Element       xpath=//span[normalize-space()='Add player']
Type in Name
    Input Text   ${NAMEFIELD}        Max
Type in Surname
    Input Text   ${SURNAMEFIELD}        Minston
Type in Age
    Input Text   ${AGEFIELD}        01.09.1996
Type in Main position
    Input Text   ${MAINPOSITIONFIELD}       goalkeeper
Click on the Submit player button
    Click Element       xpath=//button[@type='submit']
Assert dashboard
    wait until element is visible   ${PAGELOGO}
    title should be     Scouts panel
    Capture Page Screenshot     alert.png

Assert add player page
    wait until element is visible   ${ADDPLAYERTITLE}
    title should be     Add player
    Capture Page Screenshot     alert.png
