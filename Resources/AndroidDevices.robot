*** Settings ***
Resource    DefineMobileBrowser.robot

*** Keywords ***
Android devices
    &{MOBILE_DEVICES_Android}       create Dictionary    pixel=Pixel 5        s8=Samsung Galaxy S8+       fold=Galaxy Fold       as1=Samsung Galaxy AS1/71
    set test variable       &{MOBILE_DEVICES_Android}