@echo off
:: 设置 XML 文件名（请确保与你的文件名一致）
set "taskName=自动休眠任务"
set "xmlName=HibernateTask.xml"

:: 检查管理员权限
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo [错误] 请右键点击此脚本，选择“以管理员身份运行”。
    pause
    exit /b
)

:: 检查 XML 文件是否存在
if not exist "%~dp0%xmlName%" (
    echo [错误] 在当前目录下找不到文件: %xmlName%
    pause
    exit /b
)

:: 执行导入命令
echo 正在从当前目录导入任务: %xmlName%...
schtasks /create /xml "%~dp0%xmlName%" /tn "%taskName%" /f

if %errorlevel% equ 0 (
    echo.
    echo [成功] 任务计划已成功导入！
) else (
    echo.
    echo [失败] 导入过程中出现错误。
)

pause