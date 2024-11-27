# PowerShell Script to Send HTML Email to Multiple Recipients
$smtpServer = "mail.monmouth.edu"                 # Your SMTP server
$smtpFrom = "no-reply@authmeta.com"               # Sender email address
$subject = "Verify Your Meta Account"   # Subject line
$body = Get-Content -Path "C:\Users\G. Singh (CS-599)\Desktop\email_content.txt" -Raw
$message = New-Object System.Net.Mail.MailMessage
$message.From = $smtpFrom
$message.Subject = $subject
$message.Body = $body
$message.IsBodyHtml = $true

# Complete List of Recipients (Including new ones)
$recipients = @(
    "s1314118@monmouth.edu",   # Justin Vunic
    "s1306205@monmouth.edu",   # Estania Blanc Doblas
    "s1313642@monmouth.edu",   # Nicholas Genardi
    "s1314874@monmouth.edu",   # Ryan Wire
    "s1320326@monmouth.edu",   # Noah Ferker
    "s1321890@monmouth.edu",   # Michael Ivanicki
    "s1319488@monmouth.edu",   # Tennessee Tremain
    "s1320619@monmouth.edu",   # Adnan Hoti
    "s1321275@monmouth.edu",   # Omar Ahmed
    "s1324902@monmouth.edu",   # Ryan Basile
    "s1319348@monmouth.edu",   # Zakariya Ahmed
    "s1324028@monmouth.edu",   # Aaila Arif
    "s1323392@monmouth.edu",   # Andrew McGovern
    "s1323592@monmouth.edu",   # Kristina Shaw
    "s1326470@monmouth.edu",   # Ez Racancoj
    "s1328134@monmouth.edu",   # Anjali Narang
    "s1328626@monmouth.edu",   # Mar Elbanna
    "s1333911@monmouth.edu",   # Collin Gavin
    "s1319673@monmouth.edu",   # Gianna Rao
    "s1342098@monmouth.edu",   # Camryn Moschitta
    "s1346012@monmouth.edu",   # Sean Fritz
    "s1342554@monmouth.edu",   # Anthony Espanol
    "s1348902@monmouth.edu",   # Joseph Cilfone
    "s1351410@monmouth.edu",   # Matty Iessi
    "s1328575@monmouth.edu",   # Sarah Fedak
    "s1309607@monmouth.edu",   # Brendan Curiale
    "s1368609@monmouth.edu",   # Ethan Willard
    "s1369554@monmouth.edu",   # Anna Pitera
    "s1368479@monmouth.edu",   # Gavin Rossi
    "s1375322@monmouth.edu",   # Aiden Ramsay
    "s1373250@monmouth.edu",   # Connor Goodwin
    "s1373074@monmouth.edu",   # Ashley Jean-Jacques
    "s1371782@monmouth.edu",   # Joe Ventimiglia
    "s1377156@monmouth.edu",   # Isuhi Acosta
    "s1374593@monmouth.edu",   # Ikey Sasson
    "s1366294@monmouth.edu",   # Michael Yax
    "s1375380@monmouth.edu",   # Bilal Shueib
    "s1380224@monmouth.edu",   # Yves Chery
    "s1378769@monmouth.edu",   # Fabiana Torres
    "s1373168@monmouth.edu",   # Josh Castro
    "s1380163@monmouth.edu",   # Ziad Elmenshawy
    "s1378102@monmouth.edu",   # Melissa Blanc Doblas
    "s1370133@monmouth.edu",   # Avery Barnes
    "s1375298@monmouth.edu",   # Travis Osei-Asante
    "s1380882@monmouth.edu",   # John Connelly
    "s1376693@monmouth.edu",   # Sami Shah
    "s1382996@monmouth.edu",   # Sasha Vysochenko
    "s1353729@monmouth.edu",   # Garrett Boag
    "s1354051@monmouth.edu",   # Gabriella Velasquez
    "s1354404@monmouth.edu",   # Miriam Abecasis
    "s1357283@monmouth.edu",   # Lucas Vandenakker
    "s1358017@monmouth.edu",   # Kiumbura Githinji
    "s1357058@monmouth.edu",   # Jonathan Veltri
    "s1331668@monmouth.edu",   # Eli Pahountis
    "s1380763@monmouth.edu",   # Nic Mastoridis
    "s1366938@monmouth.edu",   # New Email 1
    "wqu@monmouth.edu"         # New Email 2
)

# Send email to each recipient (BCC)
foreach ($recipient in $recipients) {
    $message.Bcc.Add($recipient)  # Add each recipient to BCC
}

# Set up SMTP Client
$smtp = New-Object Net.Mail.SmtpClient($smtpServer, 25)  # Port 25 is typical for SMTP; adjust if needed

# Send the email
$smtp.Send($message)
