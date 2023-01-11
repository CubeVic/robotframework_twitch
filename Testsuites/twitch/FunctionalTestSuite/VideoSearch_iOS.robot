*** Settings ***
Library     Collections
Resource    ../../../Resources/DefineMobileBrowser.robot
Resource    ../../../Resources/Search/Search.robot
Resource    ../../../Resources/HandleModalsStreamingScreen.robot
Resource    ../devices/iOS.resource

*** Test Cases ***
#TODO: A better implementation will be Templates
Twitch iPhone SE
    iPhone SE
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


Twitch iPhone XR
    iPhone XR
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


Twitch iPhone 12
    iPhone 12
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

Twitch iPhone air
    iPhone air
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

Twitch iPhone mini
    iPhone mini
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
