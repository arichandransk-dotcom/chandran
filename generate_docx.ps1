# PowerShell script to convert internship_report.html to internship_report.docx using MS Word COM
$htmlPath = "C:\chandran\internship_report.html"
$docxPath = "C:\chandran\internship_report.docx"

Write-Output "Initializing Word Application COM object..."
try {
    $word = New-Object -ComObject Word.Application
    $word.Visible = $false
    $word.DisplayAlerts = 0 # wdAlertsNone

    Write-Output "Opening HTML file: $htmlPath"
    # Open the HTML file
    $doc = $word.Documents.Open($htmlPath)

    Write-Output "Embedding linked images..."
    # Loop through inline shapes (images) to break links and embed them permanently
    $inlineShapesCount = $doc.InlineShapes.Count
    Write-Output "Found $inlineShapesCount inline shapes."
    
    for ($i = 1; $i -le $inlineShapesCount; $i++) {
        $shape = $doc.InlineShapes.Item($i)
        if ($shape.LinkFormat -ne $null) {
            Write-Output "Embedding image $i..."
            try {
                $shape.LinkFormat.BreakLink()
            } catch {
                Write-Warning "Failed to break link: $_"
            }
        }
    }

    Write-Output "Saving document as native Word Document (.docx)..."
    # Format code 16 corresponds to wdFormatDocumentDefault (.docx)
    $doc.SaveAs([ref] $docxPath, [ref] 16)
    
    Write-Output "Closing document..."
    $doc.Close()
    
    Write-Output "Successfully generated $docxPath!"
} catch {
    Write-Error "An error occurred during conversion: $_"
} finally {
    if ($word -ne $null) {
        $word.Quit()
        # Release COM objects from memory
        [System.Runtime.InteropServices.Marshal]::ReleaseComObject($word) | Out-Null
        Remove-Variable word -ErrorAction SilentlyContinue
    }
}
