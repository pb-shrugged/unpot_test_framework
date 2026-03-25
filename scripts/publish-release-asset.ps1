param (
    [Parameter(Mandatory=$true)]
    [string]$Tag
)

# 1. Compile source files to PBL
Write-Host "Compiling source files to PBL..." -ForegroundColor Cyan
unpot compile-pbl -f

# 2. Build EXE and PBDs
Write-Host "Building EXE and PBDs..." -ForegroundColor Cyan
unpot build --pbd

# 3. Create folder structure for ZIP
$ZipFolderName = "unpot_test_framework"
$PblPath = "src\unpot_test\unpot_test.pbl"
$PbdPath = "src\unpot_test\unpot_test.pbd"

# Check if build output exists
if (-Not (Test-Path $PblPath)) {
    Write-Error "Error: unpot_test.pbl not found at $PblPath"
    exit 1
}
if (-Not (Test-Path $PbdPath)) {
    Write-Error "Error: unpot_test.pbd not found at $PbdPath"
    exit 1
}

# Clean up any existing temp folder
if (Test-Path $ZipFolderName) {
    Remove-Item -Recurse -Force $ZipFolderName
}
New-Item -ItemType Directory -Path $ZipFolderName | Out-Null

# 4. Copy files to folder
Copy-Item $PblPath -Destination $ZipFolderName
Copy-Item $PbdPath -Destination $ZipFolderName

# 5. Compress to ZIP
# Structure: ZIP contains the unpot_test_framework folder, which contains the files.
$ZipFileName = "unpot_test_framework_$($Tag)_runtime_22.0.0.1878.zip"
if (Test-Path $ZipFileName) {
    Remove-Item $ZipFileName
}

Write-Host "Creating ZIP archive $ZipFileName..." -ForegroundColor Cyan
# Using the folder itself in -Path to ensure it's the root of the ZIP
Compress-Archive -Path $ZipFolderName -DestinationPath $ZipFileName

# 6. Upload to GitHub
Write-Host "Uploading asset to GitHub Release $Tag..." -ForegroundColor Cyan
# This command uploads to an existing release. If it doesn't exist, it might fail.
# Given the user's example, we use 'upload'.
gh release upload $Tag $ZipFileName --repo pb-shrugged/unpot_test_framework --clobber

# Cleanup the temporary folder and the generated ZIP archive
Remove-Item -Recurse -Force $ZipFolderName
if (Test-Path $ZipFileName) {
    Remove-Item $ZipFileName -Force
}

Write-Host "Done! Asset uploaded successfully." -ForegroundColor Green
