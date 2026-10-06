*** Settings ***
Library    pabot.pabotlib
Library    Process
Library    String

Suite Setup     Register Running
Suite Teardown  Unregister Running
Test Setup      Check Number of Sleeps


*** Variables ***
${result}    0

*** Keywords ***
Decrease Counter
    Acquire Lock  name=Change_counter
    ${count}=    Get Parallel Value For Key    STOPPED_COUNT
    ${count}=    Evaluate    int(${count}) - 1
    Set Parallel Value For Key    STOPPED_COUNT    ${count}
    Log To Console  message=Decreased COUNTER to ${count}
    Release Lock  name=Change_counter

Check Number of Sleeps
    Acquire Lock  name=Change_counter
    ${count}=    Get Parallel Value For Key    STOPPED_COUNT
    ${count}=    Set Variable If    '${count}' == ''    0    ${count}
    ${count}=    Evaluate    int(${count}) + 1
    Set Parallel Value For Key    STOPPED_COUNT    ${count}
    Log To Console  message=Incremented COUNTER to ${count}
    Release Lock  name=Change_counter

    Acquire Lock    name=check_sleeps
    ${result}=      Run Process   shell=On  command=ps -ef | grep sleep | grep -v grep | wc -l
    ${num_sleeps}=  Replace String    ${result.stdout}    ${SPACE}    ${EMPTY}
    Log To Console  message=Number of SLEEPs are ${num_sleeps}
    
    IF  $num_sleeps == '5'
        Log To Console  message=Going to kill all sleeps
        WHILE  True
            ${count}=    Get Parallel Value For Key    STOPPED_COUNT
            ${n}=        Get Parallel Value For Key    RUNNING
            Log To Console  message=${count}
            Sleep  1
            IF  $count == $n
                Log To Console  message=All processes are at SETUP stage. Going to kill all sleeps
                Run Process  shell=True  command=sudo pkill -9 sleep
                BREAK
            END
        END
        Log To Console  message=Killing all sleeps
    END
    ${result}=      Run Process   shell=On  command=ps -ef | grep sleep | grep -v grep | wc -l
    ${num_sleeps}=  Replace String    ${result.stdout}    ${SPACE}    ${EMPTY}
    Log To Console  message=Number of SLEEPs are ${num_sleeps} 
    Release Lock  name=check_sleeps

    Acquire Lock  name=Change_counter
    ${count}=    Get Parallel Value For Key    STOPPED_COUNT
    ${count}=    Evaluate    int(${count}) - 1
    Set Parallel Value For Key    STOPPED_COUNT    ${count}
    Log To Console  message=Decreased COUNTER to ${count}
    Release Lock  name=Change_counter

Register Running
    Acquire Lock    running
    ${n}=    Get Parallel Value For Key    RUNNING
    ${n}=    Evaluate    int($n or 0) + 1
    Set Parallel Value For Key    RUNNING    ${n}
    Log To Console  message=Number of processes running: ${n}
    Release Lock    running

Unregister Running
    Acquire Lock    running
    ${n}=    Get Parallel Value For Key    RUNNING
    ${n}=    Evaluate    max(int($n or 0) - 1, 0)
    Set Parallel Value For Key    RUNNING    ${n}
    Log To Console  message=Number of processes running: ${n}
    Release Lock    running


*** Test Cases ***
Test1
    Log To Console  message=\nRunning Test 1
    ${random_num}=  Set Variable    ${{random.randint(1, 10)}}
    Start Process     shell=sh  command=sleep 1000 &
    Sleep           ${random_num}s
    Log To Console  message=Finished test 1 after sleeping ${random_num}s

Test2
    Log To Console  message=\nRunning Test 2
    ${random_num}=  Set Variable    ${{random.randint(1, 10)}}
    Start Process     shell=sh  command=sleep 1000 &
    Sleep           ${random_num}s
    Log To Console  message=Finished test 2 after sleeping ${random_num}s

Test3
    Log To Console  message=\nRunning Test 3
    ${random_num}=  Set Variable    ${{random.randint(1, 10)}}
    Start Process     shell=sh  command=sleep 1000 &
    Sleep           ${random_num}s
    Log To Console  message=Finished test 3 after sleeping ${random_num}s

Test4
    Log To Console  message=\nRunning Test 4
    ${random_num}=  Set Variable    ${{random.randint(1, 10)}}
    Start Process     shell=sh  command=sleep 1000 &
    Sleep           ${random_num}s
    Log To Console  message=Finished test 4 after sleeping ${random_num}s

Test5
    Log To Console  message=\nRunning Test 5
    ${random_num}=  Set Variable    ${{random.randint(1, 10)}}
    Start Process     shell=sh  command=sleep 1000 &
    Sleep           ${random_num}s
    Log To Console  message=Finished test 1 after sleeping ${random_num}s

Test6
    Log To Console  message=\nRunning Test 6
    ${random_num}=  Set Variable    ${{random.randint(1, 10)}}
    Start Process     shell=sh  command=sleep 1000 &
    Sleep           ${random_num}s
    Log To Console  message=Finished test 2 after sleeping ${random_num}s

Test7
    Log To Console  message=\nRunning Test 7
    ${random_num}=  Set Variable    ${{random.randint(1, 10)}}
    Start Process     shell=sh  command=sleep 1000 &
    Sleep           ${random_num}s
    Log To Console  message=Finished test 3 after sleeping ${random_num}s

Test8
    Log To Console  message=\nRunning Test 8
    ${random_num}=  Set Variable    ${{random.randint(1, 10)}}
    Start Process     shell=sh  command=sleep 1000 &
    Sleep           ${random_num}s
    Log To Console  message=Finished test 4 after sleeping ${random_num}s
