*** Settings ***
Library  SeleniumLibrary
Library  Collections

*** Variables ***
${MOBILE_DEVICE}        iPhone XR
${WARNING_MESSAGE}      //div[text()='Start Watching']
${SEARCH_BUTTON}        //button[@aria-label='Search']
${SEARCH_INPUT}         //input[@type='search']
${TAB_CHANNELS}         //div/p[text()='Channels']
${LIST_VIDEOS}          //div[@role='list']//a
${ALL_VIDEOS_LIST}      //a[@class='ScCoreLink-sc-udwpw5-0 hnofyY tw-link']
${LIGHTWEIGHT_MODAL}    //button[@aria-label='Close']

*** Keywords ***
Define mobile browser
    ${mobile emulation}=    Create Dictionary    deviceName=${MOBILE_DEVICE}
    ${chrome options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome options}    add_experimental_option    mobileEmulation    ${mobile emulation}
    Create Webdriver    Chrome    chrome_options=${chrome options}

Search for keyword
    Wait Until Element Is Visible   ${SEARCH_INPUT}
    Input Text                      ${SEARCH_INPUT}  monster hunter: world
    Press keys                      ${SEARCH_INPUT}  ENTER

scroll
    FOR     ${i}        IN RANGE       0        10
        TRY
            Press keys      NONE    TAB
            LOG TO CONSOLE      ${i}
        EXCEPT
            LOG TO CONSOLE  use tab to scroll down
        END
    END

Try specific channel
    ${videos}=  Get WebElements     ${ALL_VIDEOS_LIST}
    TRY
       Click element                //a[@href='/94goinwater']
       LOG TO CONSOLE               Channel found
    EXCEPT
        LOG TO CONSOLE              The specific channel is not in the list. click random channel
        Click element               ${videos}[-1]
    END


Close lightweight model message
    Wait until element is visible   ${LIGHTWEIGHT_MODAL}
    Click element                   ${LIGHTWEIGHT_MODAL}

Check for content warning
    TRY
        Wait until element is visible   ${WARNING_MESSAGE}
        Click element                   ${WARNING_MESSAGE}
    EXCEPT
        log to console  No warning message
    END

*** Test Cases ***
Twitch test
    Define mobile browser
    Go To                           https://twitch.tv
    Wait Until Element Is Visible   ${SEARCH_BUTTON}
    Click button                    ${SEARCH_BUTTON}
    Search for keyword
    Click element                   ${TAB_CHANNELS}
    Wait Until Element Is Visible   ${LIST_VIDEOS}
    Try specific channel
    Close lightweight model message
    Check for content warning
    Sleep  5 secs
    Capture page screenshot
    [Teardown]  close browser

