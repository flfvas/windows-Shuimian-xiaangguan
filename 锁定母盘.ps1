#LockMotherDisk.ps1



# --- 配置区 ---
$FilePath = "D:\VHD\SSFiles1.vhdx"  # 你的母盘路径
$NewExtension = ".locked"        # 自定义的隐身后缀

# 1. 检查文件是否存在
if (!(Test-Path $FilePath)) { Write-Error "找不到文件"; exit }

# 2. 修改后缀名
$NewPath = $FilePath + $NewExtension
Rename-Item -Path $FilePath -NewName ($FilePath + $NewExtension) -Force
Write-Host "1. 后缀名已更改为: $NewExtension" -ForegroundColor Cyan

# 3. 设置为“只读”属性
Set-ItemProperty -Path $NewPath -Name IsReadOnly -Value $true
Write-Host "2. 只读属性已开启" -ForegroundColor Cyan

# 4. 修改所有者为 SYSTEM 并移除用户权限
# 注意：此步骤需要管理员权限运行
takeown /f $NewPath
icacls $NewPath /inheritance:r
icacls $NewPath /grant:r "SYSTEM:(F)"
icacls $NewPath /grant:r "Administrators:(R)"
Write-Host "3. 权限已加固：所有者已设为 SYSTEM，普通访问已封锁" -ForegroundColor Cyan

Write-Host "--- 母盘加固完成 ---" -ForegroundColor Green