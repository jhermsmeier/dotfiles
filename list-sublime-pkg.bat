@echo off
cd %appdata%
cd "Sublime Text 2\Packages"

for /d %%i in (*) do (
  IF EXIST "%%i\.git" (
      REM echo "%%i"
      cmd /c "cd %appdata%\Sublime Text 2\Packages\%%i && git cloneurl"
  )
)