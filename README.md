# Splunk Windows Detection System 🚨

A hands-on SIEM project built to detect suspicious Windows activity using **Splunk Enterprise** and the **Splunk Universal Forwarder (UF)**.  
This project showcases how to forward Windows Security and PowerShell logs into Splunk, simulate attacks, and visualize detections through custom dashboards.  

---

## 🔹 Project Overview

- **Goal:** Detect and monitor common attack techniques on Windows endpoints.  
- **Tools Used:**  
  - Splunk Enterprise  
  - Splunk Universal Forwarder (UF)  
  - Windows Event Logs (Security, PowerShell/Operational)  
  - PowerShell simulation scripts  

---

## 🔹 Features & Detections

### 1. Failed Logon Attempts
- EventCode: **4625** (Security Log)  
- Detection of brute-force or password guessing attempts.  
- Dashboard shows account name, source IP, and workstation name.  

### 2. Suspicious PowerShell Activity
- EventCode: **4104** (PowerShell Operational Log)  
- Detection of potentially malicious commands such as:  
  - EncodedCommand  
  - IEX (Invoke-Expression)  
  - FromBase64String  
  - Invoke-WebRequest  
- Dashboard highlights suspicious script blocks per host/user.  

---

## 🔹 Project Architecture

1. **Splunk Universal Forwarder (UF):**
   - Installed on Windows endpoint.  
   - Configured via `inputs.conf` and `outputs.conf` to forward Security and PowerShell logs.  

2. **Splunk Enterprise (Indexer/Search Head):**
   - Receives logs from UF.  
   - Custom dashboards created for monitoring detections.  

3. **Testing & Validation:**
   - PowerShell scripts (`tests/`) simulate failed logons and PowerShell commands.  
   - Validated detections appear in Splunk searches and dashboards.  

---


## 🔹 How to Run

1. **Install Splunk Enterprise** and ensure port **9997** is enabled (Receiving data).  
2. **Install Splunk Universal Forwarder** on the Windows machine.  
3. Configure:
   - `inputs.conf` → enable Security + PowerShell logs.  
   - `outputs.conf` → forward logs to your Splunk indexer.  
4. Restart Splunk UF:  
   ```powershell
   net stop splunkforwarder
   net start splunkforwarder
Run attack simulations (from tests/ folder):


.\simulate_failed_logons.ps1
.\simulate_powershell_commands.ps1
Search in Splunk:

Failed logons → index=main source="WinEventLog:Security" EventCode=4625

PowerShell commands → index=main source="WinEventLog:Microsoft-Windows-PowerShell/Operational" EventCode=4104

🔹 Screenshots
Failed Logons (4625)	Suspicious PowerShell (4104)

🔹 Skills Demonstrated
Splunk SIEM setup (UF + Indexer).

Windows Event Forwarding.

Security log analysis (4625 failed logons).

PowerShell attack detection (4104 script block logging).

Custom Splunk dashboards & queries.

Hands-on threat simulation in a home lab.


My project is part of my journey in Security Operations & Threat Detection.
It demonstrates practical SOC skills: log forwarding, detection engineering, and SIEM dashboards.


