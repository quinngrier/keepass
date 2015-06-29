@ ECHO OFF
VERIFY OTHER 2>NUL
SETLOCAL ENABLEEXTENSIONS
IF ERRORLEVEL 1 (
  (ECHO Command extensions could not be enabled.) >&2
  GOTO END
)
SET GIT_WORK_TREE=%0
SET GIT_WORK_TREE=%GIT_WORK_TREE:"=%
FOR %%I IN ("%GIT_WORK_TREE%") DO (
  SET GIT_WORK_TREE=%%~dpI.
)
SET GIT_DIR=%GIT_WORK_TREE%\.gitkdbx
git %*
:END

REM
REM The authors of this file have waived all copyright and
REM related or neighboring rights to the extent permitted by
REM law as described by the CC0 1.0 Universal Public Domain
REM Dedication. You should have received a copy of the full
REM dedication along with this file, typically as a file
REM named [CC0-1.0.txt]. If not, it may be available at
REM [https://creativecommons.org/publicdomain/zero/1.0/].
REM
