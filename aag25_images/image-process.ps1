$files = Get-ChildItem "*.png" | Sort-Object Name
$output = @()

foreach ($file in $files) {
    $relativePath = $file.Name
    $output += "file '$relativePath'"
    $output += "duration 4"
}

# Add the last file again without duration (required by ffmpeg)
$lastFile = $files[-1].Name
$output += "file '$lastFile'"

$output | Out-File -FilePath "filelist.txt" -Encoding ascii