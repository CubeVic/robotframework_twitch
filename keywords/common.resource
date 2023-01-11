*** Settings ***
Resource        profiles/devices/android.resource
Library         SeleniumLibrary

*** Variables ***
${url}        https://twitch.com

*** Keywords ***
Open application
    [Arguments]     ${url}   ${browser}=Chrome        @{vargs}

    ${mobile emulation}=    Create Dictionary    deviceName=${Android_devices}[pixel]
    #TODO: Can we change thise to use the open browser and the desired capabilities?
    &{options}        Create Dictionary    mobileEmulation=${mobile emulation}
    open browser    ulr=${url}
    ...             browser=Chrome
    ...             options=&{options}
