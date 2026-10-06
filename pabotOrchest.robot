*** Settings ***
Library    pabot.pabotlib

Test Setup      TestSetup
#Test Teardown   Settings.Test Teardown

*** Variables ***

*** Keywords ***
TestSetup
    ${stop}=    Get Parallel Value For Key    STOP
    Log To Console  \nSTOP variable is ${stop}

*** Test Cases ***
Test1
    Log To Console  message=\nRunning Test 1
    ${random_num}=    Set Variable    ${{random.randint(1, 10)}}
    Sleep           ${random_num}s
    Log To Console  message=Finished test 1 after sleeping ${random_num}s

Test2
    Log To Console  message=\nRunning Test 2
    Acquire Lock    stop_counter
    Log To Console  message=Acquired lock
    ${stop}=    Get Parallel Value For Key    STOP
    IF    $stop == ''
        Log To Console  STOP variable is ${stop}
        Set Parallel Value For Key    key=STOP    value=True
        Log To Console  Set Parallel key STOP to True
    END
    Release Lock    stop_counter
    Log To Console  message=Released lock
    ${random_num}=    Set Variable    ${{random.randint(1, 10)}}
    Sleep           ${random_num}s
    Log To Console  message=Finished test 2 after sleeping ${random_num}s

Test3
    Log To Console  message=\nRunning Test 3
    ${random_num}=    Set Variable    ${{random.randint(1, 10)}}
    Sleep           ${random_num}s
    Log To Console  message=Finished test 3 after sleeping ${random_num}s

Test4
    Log To Console  message=\nRunning Test 4
    ${random_num}=    Set Variable    ${{random.randint(1, 10)}}
    Sleep           ${random_num}s
    Log To Console  message=Finished test 4 after sleeping ${random_num}s
