$path = "C:\Users\Logic saint\OneDrive\Documents\New folder\fonction-publique.html"
$bytes = [System.IO.File]::ReadAllBytes($path)
$iso = [System.Text.Encoding]::GetEncoding(28591)
$text = $iso.GetString($bytes)
[System.IO.File]::WriteAllText($path, $text, [System.Text.UTF8Encoding]::new($false))
Write-Host "done"
