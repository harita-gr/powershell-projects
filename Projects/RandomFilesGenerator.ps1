$Extensions = @(
    "txt", "docx", "xlsx", "pdf", "jpg", "png", "mp3", "mp4", "zip", "exe"
)
$fileCount = 100
$directory = "tmp\RandomFiles"

# Create the directory if it does not exist
if (-not (Test-Path -Path $directory)) {
    New-Item -ItemType Directory -Path $directory | Out-Null
}

# Generate random files
for ($i = 1; $i -le $fileCount; $i++) {
    $extension = Get-Random -InputObject $Extensions
    $fileName = "File_$i.$extension"
    $filePath = Join-Path -Path $directory -ChildPath $fileName # Combine directory and file name eg: tmp\RandomFiles\File_1.txt

    # Create an empty file
    New-Item -ItemType File -Path $filePath | Out-Null

    # Optionally, write some random content to the file
    if ($extension -eq "txt") {
        Add-Content -Path $filePath -Value "This is a random text file."
    }
    elseif ($extension -eq "docx") {
        Add-Content -Path $filePath -Value "This is a random Word document."
    }
    elseif ($extension -eq "xlsx") {
        Add-Content -Path $filePath -Value "This is a random Excel spreadsheet."
    }
    elseif ($extension -eq "pdf") {
        Add-Content -Path $filePath -Value "This is a random PDF document."
    }
    elseif ($extension -eq "jpg" -or $extension -eq "png") {
        Add-Content -Path $filePath -Value "This is a random image file."
    }
    elseif ($extension -eq "mp3") {
        Add-Content -Path $filePath -Value "This is a random audio file."
    }
    elseif ($extension -eq "mp4") {
        Add-Content -Path $filePath -Value "This is a random video file."
    }
    elseif ($extension -eq "zip") {
        Add-Content -Path $filePath -Value "This is a random compressed file."
    }
    elseif ($extension -eq "exe") {
        Add-Content -Path $filePath -Value "This is a random executable file."
    }
    Write-Output "Created: $filePath"
    
}