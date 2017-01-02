@ ECHO OFF
SETLOCAL
IF "%GIT%" == "" (
  SET GIT=git
)
%GIT% --git-dir=.gitkdbx --work-tree=. %*

REM
REM The authors of this file have waived all copyright and
REM related or neighboring rights to the extent permitted by
REM law as described by the CC0 1.0 Universal Public Domain
REM Dedication. You should have received a copy of the full
REM dedication along with this file, typically as a file
REM named [CC0-1.0.txt]. If not, it may be available at
REM [https://creativecommons.org/publicdomain/zero/1.0/].
REM
