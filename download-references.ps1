# PowerShell script to download business reference files
# Run with: .\download-references.ps1

$outputDir = "public\references"

# Create output directory if it doesn't exist
if (-not (Test-Path $outputDir)) {
    New-Item -ItemType Directory -Path $outputDir -Force | Out-Null
    Write-Host "Created directory: $outputDir" -ForegroundColor Green
}

# Array of reference files to download
$references = @(
    @{ url = "https://www.klausbertel.dk/wp-content/uploads/2017/09/FalckHealthcare.pdf"; filename = "FalckHealthcare.pdf" },
    @{ url = "https://www.klausbertel.dk/wp-content/uploads/2017/09/Siemens-Stress-fordrag.pdf"; filename = "Siemens-Stress-fordrag.pdf" }
)

Write-Host ""
Write-Host "Starting download of $($references.Count) reference files..." -ForegroundColor Cyan
Write-Host ""

$successCount = 0
$failCount = 0
$i = 0

foreach ($ref in $references) {
    $i++
    $filepath = Join-Path $outputDir $ref.filename
    
    Write-Host "[$i/$($references.Count)] Downloading: $($ref.filename)" -ForegroundColor Yellow
    
    try {
        Invoke-WebRequest -Uri $ref.url -OutFile $filepath -ErrorAction Stop
        $successCount++
        Write-Host "  Success" -ForegroundColor Green
    }
    catch {
        $failCount++
        Write-Host "  Failed: $($_.Exception.Message)" -ForegroundColor Red
    }
    
    # Small delay to avoid overwhelming the server
    Start-Sleep -Milliseconds 300
}

Write-Host ""
Write-Host "=== Download Complete ===" -ForegroundColor Cyan
Write-Host "Success: $successCount" -ForegroundColor Green
Write-Host "Failed: $failCount" -ForegroundColor Red
Write-Host "Total: $($references.Count)" -ForegroundColor Cyan
Write-Host ""
Write-Host "Files saved to: $outputDir" -ForegroundColor Green
