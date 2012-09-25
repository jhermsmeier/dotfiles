@echo off

for /d %%i in (*) do (
  IF EXIST "%%i\.git" (
      REM echo "%%i"
      cmd /c "cd C:\Users\Jonas\AppData\Roaming\Sublime Text 2\Packages\%%i && git cloneurl"
  )
)