# Generates Windows Security 4625 events (failed logon attempts)
1..5 | ForEach-Object {
    Start-Sleep -Milliseconds 300
    cmd /c "runas /user:%COMPUTERNAME%\NoSuchUser cmd.exe" 2>$null
}
Write-Host "Generated failed logon attempts (EventCode=4625)."
