$path = "C:\Users\Logic saint\OneDrive\Documents\New folder\fonction-publique.html"
$content = [System.IO.File]::ReadAllText($path)

$replacements = @{
    'Ã©' = 'é'
    'Ã¨' = 'è'
    'Ãª' = 'ê'
    'Ã«' = 'ë'
    'Ã¹' = 'ù'
    'Ã»' = 'û'
    'Ã¼' = 'ü'
    'Ã¢' = 'â'
    'Ã‰' = 'É'
    'Ãˆ' = 'È'
    'ÃŠ' = 'Ê'
    'Ã‡' = 'Ç'
    'Ã§' = 'ç'
    'A,A' = 'a F'
    'â€™' = "'"
    'â€˜' = "'"
    'â€œ' = '"'
    'â€' = '"'
    'â€“' = '-'
    'â€”' = '-'
    'â€¢' = '-'
    'â€¦' = '...'
    "l'Ã‰tat" = "l'État"
    'Ã‰tat' = 'État'
    'Ã€' = 'À'
}

foreach ($key in $replacements.Keys) {
    $content = $content.Replace($key, $replacements[$key])
}

# Fix Ã followed by space -> à
$content = $content -replace 'Ã ', 'à'

# Fix consonant + Ã patterns
$content = $content -replace '([bcdfghjklmnpqrstvwxyzBCDFGHJKLMNPQRSTVWXYZ])Ã©', '$1é'
$content = $content -replace '([bcdfghjklmnpqrstvwxyzBCDFGHJKLMNPQRSTVWXYZ])Ã¨', '$1è'
$content = $content -replace '([bcdfghjklmnpqrstvwxyzBCDFGHJKLMNPQRSTVWXYZ])Ãª', '$1ê'
$content = $content -replace '([bcdfghjklmnpqrstvwxyzBCDFGHJKLMNPQRSTVWXYZ])Ã¢', '$1â'
$content = $content -replace '([bcdfghjklmnpqrstvwxyzBCDFGHJKLMNPQRSTVWXYZ])Ã»', '$1û'
$content = $content -replace '([bcdfghjklmnpqrstvwxyzBCDFGHJKLMNPQRSTVWXYZ])Ã¹', '$1ù'
$content = $content -replace '([bcdfghjklmnpqrstvwxyzBCDFGHJKLMNPQRSTVWXYZ])Ã¼', '$1ü'

# Fix specific title
$content = $content -replace 'Fonction publique A,A', 'Fonction publique a F'

# Also check for the "?" pattern from wrong encoding
$content = $content -replace '\?', "'"

[System.IO.File]::WriteAllText($path, $content, [System.Text.UTF8Encoding]::new($false))
Write-Host "Encoding fixed"
