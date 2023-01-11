*** Settings ***
Resource        profiles/devices/android.resource
Library         SeleniumLibrary
Library         %{RESOURCES}/keywords/common.resource

*** Variables ***
${url}        https://twitch.com

*** Test Cases ***
Open application     url=${url}
