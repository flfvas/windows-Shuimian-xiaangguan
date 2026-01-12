@echo off
REM 激活当前目录下的 venv
call "%cd%\.venv\Scripts\activate"

REM 运行当前目录下的所有 .py 文件（逐个执行）
for %%f in (*.py) do (
    echo 正在运行 %%f ...
    python "%%f"
)

pause