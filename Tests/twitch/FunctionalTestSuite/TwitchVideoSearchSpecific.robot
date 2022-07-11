*** Settings ***
Library  Collections
Library  SeleniumLibrary


*** Variables ***
${WARNING_MESSAGE}      //div[text()='Start Watching']
${SEARCH_BUTTON}        //button[@aria-label='Search']
${SEARCH_INPUT}         //input[@type='search']
${TAB_CHANNELS}         //div/p[text()='Channels']
${LIST_VIDEOS}          //div[@role='list']//a

*** Keywords ***
Define mobile browser
    ${mobile emulation}=    Create Dictionary    deviceName=iPhone XR
    ${chrome options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome options}    add_experimental_option    mobileEmulation    ${mobile emulation}
    Create Webdriver    Chrome    chrome_options=${chrome options}

Search for keyword
    Wait Until Element Is Visible  ${SEARCH_INPUT}
    input text  ${SEARCH_INPUT}  monster hunter: world
    press keys  ${SEARCH_INPUT}  ENTER

Scroll Down
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

Close lightweight model message
    wait until element is visible  //button[@aria-label='Close']
    click element  //button[@aria-label='Close']

Check for content warning
    TRY
        wait until element is visible  ${WARNING_MESSAGE}
        click element  ${WARNING_MESSAGE}
    EXCEPT
        log to console  No warning message
    END


*** Test Cases ***
Twitch test with scrolling
    Define mobile browser
    Go To                           https://twitch.tv
    Wait Until Element Is Visible   ${SEARCH_BUTTON}
    click button                    ${SEARCH_BUTTON}
    Search for keyword
    click element                   ${TAB_CHANNELS}
    Wait Until Element Is Visible   ${LIST_VIDEOS}
    Scroll Down
    Capture page Screenshot
    Try specific channel
    Close lightweight model message
    Check for content warning
    Sleep  5 secs
    Capture page screenshot
    [teardown]  close browser


