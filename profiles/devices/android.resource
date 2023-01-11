*** Settings ***
Resource    DefineMobileBrowser.robot

*** Variables ***
&{Android_devices}=       pixel=Pixel 5        s8=Samsung Galaxy S8+       fold=Galaxy Fold       s20=Samsung Galaxy S20 Ultra

*** Keywords ***
Define mobile browser
    [Arguments]         ${MOBILE_DEVICE}
    ${mobile emulation}=    Create Dictionary    deviceName=${MOBILE_DEVICE}
    #TODO: Can we change thise to use the open browser and the desired capabilities?
    # ${chrome options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    # Call Method    ${chrome options}    add_experimental_option    mobileEmulation    ${mobile emulation}
    # Create Webdriver    Chrome    chrome_options=${chrome options}
    # # &{desired_capabilities}        Create Dictionary
    &{options}        Create Dictionary    mobileEmulation=${mobile emulation}
    open browser    ulr=${url}
    ...             browser=Chrome
    ...             options=${options}

Pixel 5
    Define mobile browser       ${Android_devices}['pixel']


Samsung Galaxy S8+
    Define mobile browser       ${Android_devices}['s8']

Galaxy Fold
    Define mobile browser       ${Android_devices}['fold']

Samsung Galaxy S20 Ultra
    Define mobile browser       ${Android_devices}['s20']
