# --- 自动提权声明 ---
if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs
    exit
}

# --- 配置区 ---
$ParentDiskPath = "D:\VHD\SSFiles1.vhdx.locked"

# --- 执行区 ---
if (!(Test-Path $ParentDiskPath)) {
    Write-Host "错误：找不到母盘，请确认路径。" -ForegroundColor Red
    pause; exit
}

# 提取文件名并生成子盘路径
$ParentFolder = Split-Path -Path $ParentDiskPath
$CleanName = (Get-Item $ParentDiskPath).Name -replace "\.locked$", "" -replace "\.vhdx$", ""
$DiffDiskPath = Join-Path -Path $ParentFolder -ChildPath ($CleanName + "_Diff.vhdx")

Write-Host "正在通过 Diskpart 创建差异磁盘..." -ForegroundColor Cyan

# 生成 Diskpart 脚本命令
$DiskpartScript = @"
create vdisk file="$DiffDiskPath" parent="$ParentDiskPath"
attach vdisk
"@

# 执行 Diskpart
$DiskpartScript | diskpart

if ($LASTEXITCODE -eq 0) {
    Write-Host "`n--- 成功！差异磁盘已创建并挂载 ---" -ForegroundColor Green
    Write-Host "子盘路径: $DiffDiskPath" -ForegroundColor White
} else {
    Write-Host "`n创建失败，请检查路径是否包含空格或权限是否正常。" -ForegroundColor Red
}

pause