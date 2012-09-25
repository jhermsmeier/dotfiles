@echo off
cd %appdata%
cd "Sublime Text 2\Packages"
echo -------------------------------------------------------

for /d %%i in (*) do (
  IF EXIST "%%i\.git" (
    echo Updating "%%i":
    cmd /c "cd %appdata%\Sublime Text 2\Packages\%%i && git dn -q"
    echo -------------------------------------------------------
  )
)