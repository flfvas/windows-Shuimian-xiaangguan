:: @echo off
:: REM 检查是否安装 auto-py-to-exe
:: pip show auto-py-to-exe >nul 2>&1
:: IF ERRORLEVEL 1 (
::     echo 未检测到 auto-py-to-exe，正在安装...
::     pip install auto-py-to-exe
:: )

::echo 启动 auto-py-to-exe...
::auto-py-to-exe



@echo off
echo 启动 auto-py-to-exe...
start "" pythonw -m auto_py_to_exe