*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${WARNING_MESSAGE}          //div[text()='Start Watching']
${LIGHTWEIGHT_MODAL}        //button[@aria-label='Close']
*** Keywords ***
Close lightweight model message
    TRY
        Wait until element is visible       ${LIGHTWEIGHT_MODAL}
        Click element                       ${LIGHTWEIGHT_MODAL}
    EXCEPT
            log to console  No ligthweight modal
    END

Check for content warning
    TRY
        Wait until element is visible   ${WARNING_MESSAGE}
        Click element                   ${WARNING_MESSAGE}
    EXCEPT
        log to console  No warning message
    END
