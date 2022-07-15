*** Settings ***
Resource    DefineMobileBrowser.robot

*** Keywords ***
iOS devices
    &{MOBILE_DEVICES_iOS}       create Dictionary    SE=iPhone SE        XR=iPhone XR        12=iPhone 12 Pro        air=iPad Air        mini=iPad Mini
    set test variable       &{MOBILE_DEVICES_iOS}