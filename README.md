# Twitch Home Test

>Using RobotFramework and Selenium Library.
> 
> By default, it uses the iPhone XR mobile emulator from Chrome
## Description 

It is divided in two folders:

* `Test`: Directory containing the different directories with different test
* `Test/FunctionalTestSuite`:  Contain the `.robot` files with the actual test case.
* `TwitchVideoSearch.robot`:  The file containing the test case.
* `Results`: contain the output files and the screenshot.

## How to run 
It requires the follow libraries.

* robotframework>=5.0.1 
* robotframework-seleniumlibrary>=6.0.0
* It required Chromedriver

## Test Case Description
1. Go to https://www.twitch.tv
2. Click in Search button.
3. Search for "Monster Hunter World".
4. Switch to Channels tab.
5. Scroll down. 
6. Search for "CervelloneRe" if no find choose random channel.
7. Close lightweight modal message.
8. If present click in start watching (Content Warning).
9. Wait for 5 seconds.
10. Take snapshot.

## ScreenCast
![ScreenCast](images/robotframework_screencast.gif)

## Compromises

1. Since there is not an APK the emulation is down by using the mobile emulator of chrome.
2. The Mobile emulator interfere with the JavaScript execution, which doesn't allow the usage of  `window.scrollTo(x-coord, y-coord)`
3. To perform the scroll down I use tabs, by navigating with tabs one can scroll down, however it is not an optimal solution, a better approach will be by creating a custom library.
