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

* Since there is not an APK the emulation is down by using the mobile emulator of chrome.
* The Mobile emulator interfere with the JavaScript execution, which doesn't allow the usage of  `window.scrollTo(x-coord, y-coord)`.  
* ~~To perform the scroll down I use tabs, by navigating with tabs one can scroll down, however it is not an optimal solution, a better approach will be by creating a custom library.~~
  * Modification to the scrolling. implementing: 
    1. Select last item in the list of videos. 
    2. Scroll into view. 
    3. New videos enter the DOM. 
    4. Get new list of videos. the last video in the list will be different than previous iteration 
    5. Repeat proces
    >Not final implementation but is more robust and reusable than scrolling base in tabs 
