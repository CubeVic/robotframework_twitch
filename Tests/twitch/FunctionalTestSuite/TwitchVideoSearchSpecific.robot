*** Settings ***
Library  SeleniumLibrary
Library  Collections

*** Variables ***
*** Test Cases ***
Specifying a Known Mobile Device
    ${mobile emulation}=    Create Dictionary    deviceName=iPhone XR
    ${chrome options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome options}    add_experimental_option    mobileEmulation    ${mobile emulation}
    Create Webdriver    Chrome    chrome_options=${chrome options}
    open browser    https://twitch.tv
    Sleep    10 secs
    click button  //button[@aria-label='Search']
    input text  //input[@type='search']  monster hunter: world
    press keys  //input[@type='search']  ENTER
    click element  //div/p[text()='Channels']
    Wait Until Element Is Visible  //div[@role='list']//a
#    ${the a-s}=     Get WebElements    //a[@class='ScCoreLink-sc-udwpw5-0 hnofyY tw-link']
#    ${tamano}=  Get Length  ${the a-s}
#    scroll element into view  ${the a-s}[9]
#    ${the a-s}=     Get WebElements    //a[@class='ScCoreLink-sc-udwpw5-0 hnofyY tw-link']
##    ${tamano}=  Get Length  ${the a-s}
#    scroll element into view  ${the a-s}[9]
#    ${the a-s}=     Get WebElements    //a[@class='ScCoreLink-sc-udwpw5-0 hnofyY tw-link']
##    ${tamano}=  Get Length  ${the a-s}
#    scroll element into view  ${the a-s}[9]


#    FOR     ${i}        IN      RANGE       1       9
#        ${the a-s}=     Get WebElements    //a[@class='ScCoreLink-sc-udwpw5-0 hnofyY tw-link']
#        scroll element into view  ${the a-s}[9]
#        ${text}=  get text  ${the a-s}[9]
#        log to console  ${text}
#    END

    TRY
       click element  //a[@href='/chiamisu']
    EXCEPT
        LOG TO CONSOLE  EXCEPT with no arguments catches any exception.
    END

#    click element  //a[@href='/chiamisu']
#    wait until element is visible  //button[@aria-label='Close']
#    click element  //button[@aria-label='Close']
#    click element  //button/div/div[@data-a-target="tw-core-button-label-text"]
#    sleep  5 secs
#    capture page screenshot
