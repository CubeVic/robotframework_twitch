*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${SEARCH_BUTTON}        //button[@aria-label='Search']
${SEARCH_INPUT}         //input[@type='search']
${TAB_CHANNELS}         //div/p[text()='Channels']
${LIST_VIDEOS}          //div[@role='list']//a
${ALL_VIDEOS_LIST}      //a[@class='ScCoreLink-sc-udwpw5-0 hnofyY tw-link']

*** Keywords ***
Search for keyword
    Wait Until Element Is Visible   ${SEARCH_INPUT}
    Input Text                      ${SEARCH_INPUT}  monster hunter: world
    Press keys                      ${SEARCH_INPUT}  ENTER

Perform Search
    Wait Until Element Is Visible       ${SEARCH_BUTTON}
    Click button                        ${SEARCH_BUTTON}
    Search for keyword

Get list of videos
#TODO: part of the scrolling method to be improve, [Return] not a good practice
    @{videos}=   Get WebElements        ${ALL_VIDEOS_LIST}
    [Return]                            @{videos}

Scroll to last element
    @{videos}=                   get list of videos
    FOR     ${i}        IN RANGE    0       3

        wait until element is visible       ${videos}[-1]
        scroll element into view            ${videos}[-1]
        @{videos}=                          get list of videos
    END
    [Return]                        ${videos}[-1]

Scroll down
   TRY
        ${item}=        scroll to last element
        set test variable        ${item}
   EXCEPT
        log to console    check scroll execution
   END

Switch to tab channels
    Click element                       ${TAB_CHANNELS}
    Wait Until Element Is Visible       ${LIST_VIDEOS}

Try specific channel
    TRY
       Click element                //a[@href='/94goinwater']
       LOG TO CONSOLE               Channel found
    EXCEPT
        LOG TO CONSOLE              The specific channel is not in the list. click random channel
        scroll down
        log to console              ${item}
        Click element               ${item}
    END