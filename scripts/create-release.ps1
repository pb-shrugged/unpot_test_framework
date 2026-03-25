param (
    [Parameter(Mandatory=$true)]
    [string]$Tag,

    [Parameter(Mandatory=$false)]
    [string]$Title = "Release $Tag"
)

# Check if gh CLI is installed
if (-not (Get-Command "gh" -ErrorAction SilentlyContinue)) {
    Write-Host "Error: GitHub CLI ('gh') is not installed or not in PATH." -ForegroundColor Red
    Write-Host "Install it from: https://cli.github.com/" -ForegroundColor Yellow
    exit 1
}

# Resolve the template path relative to this script's location
$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$TemplatePath = Join-Path -Path $ScriptDir -ChildPath "release-template.md"

if (-not (Test-Path $TemplatePath)) {
    Write-Host "Error: Template file not found at $TemplatePath" -ForegroundColor Red
    exit 1
}

# Read the template and replace the {{TAG}} placeholder
$TemplateContent = Get-Content -Path $TemplatePath -Raw
$ReleaseNotes = $TemplateContent.Replace("{{TAG}}", $Tag)

# Create a temporary file to store the processed release notes
$TempNotesFile = New-TemporaryFile
Set-Content -Path $TempNotesFile.FullName -Value $ReleaseNotes -Encoding UTF8

Write-Host "Creating GitHub release with tag '$Tag'..." -ForegroundColor Cyan

$Repo = "pb-shrugged/unpot_test_framework"

gh release create $Tag `
    --title $Title `
    --notes-file $TempNotesFile.FullName `
    --repo $Repo

$ghExitCode = $LASTEXITCODE

# Clean up temporary file
if (Test-Path $TempNotesFile.FullName) {
    Remove-Item $TempNotesFile.FullName -Force
}

if ($ghExitCode -eq 0) {
    Write-Host "✅ Release created successfully!" -ForegroundColor Green
    Write-Host "You can view the release using: gh release view $Tag --repo $Repo" -ForegroundColor DarkGray
} else {
    Write-Host "❌ Failed to create GitHub release." -ForegroundColor Red
    exit $ghExitCode
}
