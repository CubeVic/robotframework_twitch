*** Settings ***
Library     Collections
Resource    ../../../Resources/DefineMobileBrowser.robot
Resource    ../../../Resources/Search/Search.robot
Resource    ../../../Resources/HandleModalsStreamingScreen.robot
Resource    ../../../Resources/AndroidDevices.robot


*** Test Cases ***
#TODO: A better implementation will be Templates
Twitch Pixel 5
    Pixel 5
    Go To                               https://twitch.tv
    Perform Search
    Switch to tab channels
    Try specific channel
    Close lightweight model message
    Check for content warning
    # TODO: Improve waiting method sleep is not recommended
    Sleep  5 secs
    Capture page screenshot
    [Teardown]  close browser

Twitch Samsung Galaxy S8+
    Samsung Galaxy S8+
    Go To                               https://twitch.tv
    Perform Search
    Switch to tab channels
    Try specific channel
    Close lightweight model message
    Check for content warning
    # TODO: Improve waiting method sleep is not recommended
    Sleep  5 secs
    Capture page screenshot
    [Teardown]  close browser

Twitch Galaxy Fold
    Galaxy Fold
    Go To                               https://twitch.tv
    Perform Search
    Switch to tab channels
    Try specific channel
    Close lightweight model message
    Check for content warning
    # TODO: Improve waiting method sleep is not recommended
    Sleep  5 secs
    Capture page screenshot
    [Teardown]  close browser

Twitch Samsung Galaxy S20 Ultra
    Samsung Galaxy S20 Ultra
    Go To                               https://twitch.tv
    Perform Search
    Switch to tab channels
    Try specific channel
    Close lightweight model message
    Check for content warning
    # TODO: Improve waiting method sleep is not recommended
    Sleep  5 secs
    Capture page screenshot
    [Teardown]  close browser
