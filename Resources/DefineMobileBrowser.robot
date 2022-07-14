*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Define mobile browser
    ${mobile emulation}=    Create Dictionary    deviceName=${MOBILE_DEVICE}
    ${chrome options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome options}    add_experimental_option    mobileEmulation    ${mobile emulation}
    Create Webdriver    Chrome    chrome_options=${chrome options}