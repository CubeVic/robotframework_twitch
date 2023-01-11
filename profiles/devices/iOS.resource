*** Settings ***
Resource    DefineMobileBrowser.robot

*** Keywords ***
iOS devices
    &{MOBILE_DEVICES_iOS}       create Dictionary    SE=iPhone SE        XR=iPhone XR        12=iPhone 12 Pro        air=iPad Air        mini=iPad Mini
    set test variable       &{MOBILE_DEVICES_iOS}

iPhone SE
    iOS devices
    Define mobile browser       ${MOBILE_DEVICES_iOS}[SE]

iPhone XR
    iOS devices
    Define mobile browser       ${MOBILE_DEVICES_iOS}[XR]

iPhone 12
    iOS devices
    Define mobile browser       ${MOBILE_DEVICES_iOS}[XR]

iPhone air
    iOS devices
    Define mobile browser       ${MOBILE_DEVICES_iOS}[air]

iPhone mini
    iOS devices
    Define mobile browser       ${MOBILE_DEVICES_iOS}[mini]
