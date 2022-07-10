*** Settings ***
Library  SeleniumLibrary
Library  Collections


*** Variables ***
*** Keywords ***
Define mobile browser
    ${mobile emulation}=    Create Dictionary    deviceName=iPhone XR
    ${chrome options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome options}    add_experimental_option    mobileEmulation    ${mobile emulation}
    Create Webdriver    Chrome    chrome_options=${chrome options}

scroll
    FOR     ${i}        IN RANGE       0        10
        TRY
            press keys      NONE    TAB
            log to console      ${i}
        EXCEPT
            LOG TO CONSOLE  use tab to scroll down
        END
    END

Try specific channel
    ${videos}=  Get WebElements    //a[@class='ScCoreLink-sc-udwpw5-0 hnofyY tw-link']
    TRY
       click element        //a[@href='/94goinwater']
       log to console  Channel found
    EXCEPT
        LOG TO CONSOLE  The specific channel is not in the list. click random channel
        click element  ${videos}[9]
    END

Check for content warning
    TRY
        click element  //div[text()='Start Watching']
    EXCEPT
        log to console  "No warning message"
    END

#Try specific channel
#    ${videos}=  Get WebElements    //a[@class='ScCoreLink-sc-udwpw5-0 hnofyY tw-link']
#    FOR     ${i}        IN RANGE        0       3
##        ${videos}=  Get WebElements    //a[@class='ScCoreLink-sc-udwpw5-0 hnofyY tw-link']
#        TRY
#            click element        //a[@href='/94goinwater']
#            log to console  Channel found
#        EXCEPT
#            LOG TO CONSOLE  The specific channel is not in the list.
#    #
#            scroll
#            ${videos}=  Get WebElements    //a[@class='ScCoreLink-sc-udwpw5-0 hnofyY tw-link']
#        END
#    END

*** Test Cases ***
Twitch test
    define mobile browser
    go to       https://twitch.tv
    Wait Until Element Is Visible  //button[@aria-label='Search']
    click button  //button[@aria-label='Search']
    Wait Until Element Is Visible  //input[@type='search']
    input text  //input[@type='search']  monster hunter: world
    press keys  //input[@type='search']  ENTER
    click element  //div/p[text()='Channels']
    Wait Until Element Is Visible  //div[@role='list']//a
    try specific channel
    wait until element is visible  //button[@aria-label='Close']
    click element  //button[@aria-label='Close']
    wait until element is visible  //div[text()='Start Watching']
    Check for content warning
    Sleep  5 secs
    capture page screenshot
    close browser


#    click element  //a[@href='/chiamisu']
#    wait until element is visible  //button[@aria-label='Close']
#    click element  //button[@aria-label='Close']
#    click element  //button/div/div[@data-a-target="tw-core-button-label-text"]




#    FOR     ${i}        IN      RANGE       1       9
#        ${the a-s}=     Get WebElements    //a[@class='ScCoreLink-sc-udwpw5-0 hnofyY tw-link']
#        scroll element into view  ${the a-s}[9]
#        ${text}=  get text  ${the a-s}[9]
#        log to console  ${text}
#    END