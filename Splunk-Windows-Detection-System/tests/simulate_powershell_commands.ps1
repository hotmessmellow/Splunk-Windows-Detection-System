# Generates Windows PowerShell Operational 4104 (script blocks)
1..5 | ForEach-Object { Write-Output ("SplunkPS-Test-" + $_) }
Invoke-Expression 'Get-Date'
Write-Host "Generated PowerShell script-block events (EventID=4104)."
