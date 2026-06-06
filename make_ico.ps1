Add-Type -AssemblyName System.Drawing

$pngPath = "c:\Users\Admin\Desktop\My systems\invict\assets\logo.png"
$icoPath = "c:\Users\Admin\Desktop\My systems\invict\icon.ico"
$assetIcoPath = "c:\Users\Admin\Desktop\My systems\invict\assets\icon.ico"

$src = [System.Drawing.Image]::FromFile($pngPath)
Write-Host "Source PNG: $($src.Width)x$($src.Height)"

# Sizes required for a proper Windows ICO
$sizes = @(16, 32, 48, 64, 128, 256)

# Build ICO manually using raw bytes
$ms = New-Object System.IO.MemoryStream
$images = @()

foreach ($size in $sizes) {
    $bmp = New-Object System.Drawing.Bitmap($size, $size, [System.Drawing.Imaging.PixelFormat]::Format32bppArgb)
    $g = [System.Drawing.Graphics]::FromImage($bmp)
    $g.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic
    $g.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::HighQuality
    $g.DrawImage($src, 0, 0, $size, $size)
    $g.Dispose()

    $imgStream = New-Object System.IO.MemoryStream
    $bmp.Save($imgStream, [System.Drawing.Imaging.ImageFormat]::Png)
    $bmp.Dispose()
    $images += $imgStream
}

$src.Dispose()

# Write ICO file structure
$writer = New-Object System.IO.BinaryWriter((New-Object System.IO.FileStream($icoPath, [System.IO.FileMode]::Create)))

# ICO header
$writer.Write([uint16]0)       # reserved
$writer.Write([uint16]1)       # type: icon
$writer.Write([uint16]$sizes.Count)  # count

# Calculate offset: header(6) + directory entries(16 * count)
$offset = 6 + 16 * $sizes.Count

# Write directory entries
for ($i = 0; $i -lt $sizes.Count; $i++) {
    $sz = $sizes[$i]
    $data = $images[$i].ToArray()
    $writer.Write([byte]$(if ($sz -eq 256) { 0 } else { $sz }))  # width (0 = 256)
    $writer.Write([byte]$(if ($sz -eq 256) { 0 } else { $sz }))  # height
    $writer.Write([byte]0)     # color count
    $writer.Write([byte]0)     # reserved
    $writer.Write([uint16]1)   # planes
    $writer.Write([uint16]32)  # bit count
    $writer.Write([uint32]$data.Length)
    $writer.Write([uint32]$offset)
    $offset += $data.Length
}

# Write image data
foreach ($imgStream in $images) {
    $writer.Write($imgStream.ToArray())
    $imgStream.Dispose()
}

$writer.Close()

# Copy to assets as well
Copy-Item $icoPath $assetIcoPath -Force

Write-Host "ICO created successfully at: $icoPath"
Write-Host "Sizes included: $($sizes -join ', ')px"
