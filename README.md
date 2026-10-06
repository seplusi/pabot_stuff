# pabot_stuff

# Splits suite tests among different pabots. In this case is 4
(env) luisarcanjo@JV4WG6M9NJ qa-auto-kiosk-app % pabot --testlevelsplit Targets/LuxerOne/Tests/pabot/pabotOrchest.robot              

Initialized logging in ./pabot_results
Warning: specified pabotlibport 8270 is already in use. A free port will be assigned automatically.
Robot Framework remote server at 127.0.0.1:58602 started.
2026-10-06 09:13:01.115808 [PID:41710] [1] [ID:2] EXECUTING pabotOrchest.Test3
2026-10-06 09:13:01.117239 [PID:41712] [3] [ID:3] EXECUTING pabotOrchest.Test4
2026-10-06 09:13:01.117398 [PID:41711] [2] [ID:1] EXECUTING pabotOrchest.Test2
2026-10-06 09:13:01.118254 [PID:41713] [0] [ID:0] EXECUTING pabotOrchest.Test1
2026-10-06 09:13:02.466568 [PID:41710] [1] [ID:2] PASSED pabotOrchest.Test3 in 1.4 seconds
2026-10-06 09:13:02.467894 [PID:41711] [2] [ID:1] PASSED pabotOrchest.Test2 in 1.4 seconds
2026-10-06 09:13:02.468753 [PID:41713] [0] [ID:0] PASSED pabotOrchest.Test1 in 1.4 seconds
2026-10-06 09:13:02.474114 [PID:41712] [3] [ID:3] PASSED pabotOrchest.Test4 in 1.4 seconds
4 tests, 4 passed, 0 failed, 0 skipped.
===================================================
Output:  /Users/luisarcanjo/Documents/projects/qa-auto-kiosk-app/output.xml
Log:     /Users/luisarcanjo/Documents/projects/qa-auto-kiosk-app/log.html
Report:  /Users/luisarcanjo/Documents/projects/qa-auto-kiosk-app/report.html
Finalizing Pabot execution...
Stopping PabotLib process
Robot Framework remote server at 127.0.0.1:58602 stopped.
PabotLib process stopped
Total testing: 5.60 seconds
Elapsed time:  1.83 seconds
Logs flushed successfully.



# Splits suite tests among different pabots. In this case is 2 because we specify
(env) luisarcanjo@JV4WG6M9NJ qa-auto-kiosk-app % pabot --testlevelsplit --processes 2 Targets/LuxerOne/Tests/pabot/pabotOrchest.robot

Robot Framework remote server at 127.0.0.1:8270 started.
2026-10-06 09:12:31.595431 [PID:41672] [0] [ID:0] EXECUTING pabotOrchest.Test1
2026-10-06 09:12:31.596361 [PID:41673] [1] [ID:1] EXECUTING pabotOrchest.Test2
2026-10-06 09:12:32.950165 [PID:41673] [1] [ID:1] PASSED pabotOrchest.Test2 in 1.4 seconds
2026-10-06 09:12:32.958710 [PID:41672] [0] [ID:0] PASSED pabotOrchest.Test1 in 1.4 seconds
2026-10-06 09:12:32.959247 [PID:41677] [0] [ID:2] EXECUTING pabotOrchest.Test3
2026-10-06 09:12:32.965355 [PID:41678] [1] [ID:3] EXECUTING pabotOrchest.Test4
2026-10-06 09:12:34.308091 [PID:41677] [0] [ID:2] PASSED pabotOrchest.Test3 in 1.4 seconds
2026-10-06 09:12:34.320939 [PID:41678] [1] [ID:3] PASSED pabotOrchest.Test4 in 1.4 seconds
4 tests, 4 passed, 0 failed, 0 skipped.
===================================================
Output:  /Users/luisarcanjo/Documents/projects/qa-auto-kiosk-app/output.xml
Log:     /Users/luisarcanjo/Documents/projects/qa-auto-kiosk-app/log.html
Report:  /Users/luisarcanjo/Documents/projects/qa-auto-kiosk-app/report.html
Finalizing Pabot execution...
Stopping PabotLib process
Robot Framework remote server at 127.0.0.1:8270 stopped.
PabotLib process stopped
Total testing: 5.60 seconds
Elapsed time:  3.11 seconds



# Here pabot executes the same suite twice. One for each arg text file.
(env) luisarcanjo@JV4WG6M9NJ pabot % pabot --argumentfile1 arg1.txt --argumentfile2 arg2.txt pabotOrchest.robot

Initialized logging in ./pabot_results
Robot Framework remote server at 127.0.0.1:8270 started.
2026-10-06 09:38:58.579719 [PID:46623] [0] [ID:0] EXECUTING pabotOrchest {arg1.txt}
2026-10-06 09:38:58.580706 [PID:46624] [1] [ID:1] EXECUTING pabotOrchest {arg2.txt}
2026-10-06 09:39:02.924854 [PID:46623] [0] [ID:0] PASSED pabotOrchest {arg1.txt} in 4.3 seconds
2026-10-06 09:39:02.945213 [PID:46624] [1] [ID:1] PASSED pabotOrchest {arg2.txt} in 4.4 seconds
8 tests, 8 passed, 0 failed, 0 skipped.
===================================================
Output:  /Users/luisarcanjo/Documents/projects/qa-auto-kiosk-app/Targets/LuxerOne/Tests/pabot/output.xml
Log:     /Users/luisarcanjo/Documents/projects/qa-auto-kiosk-app/Targets/LuxerOne/Tests/pabot/log.html
Report:  /Users/luisarcanjo/Documents/projects/qa-auto-kiosk-app/Targets/LuxerOne/Tests/pabot/report.html
Finalizing Pabot execution...
Stopping PabotLib process
Robot Framework remote server at 127.0.0.1:8270 stopped.
PabotLib process stopped
Total testing: 8.69 seconds
Elapsed time:  4.83 seconds
Logs flushed successfully.
