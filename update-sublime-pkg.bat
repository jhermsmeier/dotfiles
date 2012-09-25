@echo off
echo -------------------------------------------------------

for /d %%i in (*) do (
  IF EXIST "%%i\.git" (
    echo Updating "%%i":
    cmd /c "cd C:\Users\Jonas\AppData\Roaming\Sublime Text 2\Packages\%%i && git dn -q"
    echo -------------------------------------------------------
  )
)