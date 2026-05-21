# Dump libGameMain.so symbols for hook development (Windows + NDK llvm-nm).
param(
    [string]$SoPath = "app\src\main\jniLibs\armeabi-v7a\libGameMain.so",
    [string]$Filter = "_ZN",
    [string]$OutFile = "build\libGameMain_symbols.txt"
)

$ndk = "$env:LOCALAPPDATA\Android\Sdk\ndk"
$nm = Get-ChildItem -Path $ndk -Recurse -Filter "llvm-nm.exe" -ErrorAction SilentlyContinue |
    Select-Object -First 1

if (-not $nm) {
    Write-Error "llvm-nm.exe not found under $ndk"
    exit 1
}

if (-not (Test-Path $SoPath)) {
    Write-Error "Missing $SoPath — copy libGameMain.so from the original APK into jniLibs/armeabi-v7a/"
    exit 1
}

$dir = Split-Path $OutFile -Parent
if ($dir -and -not (Test-Path $dir)) { New-Item -ItemType Directory -Path $dir -Force | Out-Null }

& $nm.FullName -g --defined-only $SoPath |
    Select-String $Filter |
    ForEach-Object { $_.Line } |
    Set-Content -Path $OutFile -Encoding UTF8

Write-Host "Wrote $(@(Get-Content $OutFile).Count) lines to $OutFile"
