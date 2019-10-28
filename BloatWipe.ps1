$Pacakges = Get-AppxPackage -AllUsers

$BloatPackages = 0

foreach ($Package in $Pacakges)
{
    if ($Package.Publisher -eq "CN=Microsoft Windows, O=Microsoft Corporation, L=Redmond, S=Washington, C=US")
    {
        Write-Host $Package.Publisher -ForegroundColor Green
    }
    elseif ($Package.Publisher -eq "CN=Microsoft Corporation, O=Microsoft Corporation, L=Redmond, S=Washington, C=US")
    {
        Write-Host $Package.Publisher -ForegroundColor Green
    }
    elseif ($Package.Publisher -eq "CN=Skype Software Sarl, O=Microsoft Corporation, L=Luxembourg, S=Luxembourg, C=LU")
    {
        Write-Host $Package.Publisher -ForegroundColor Green
    }
    else
    {
        Write-Host $($Package.Publisher + " " + $Package.Name) -ForegroundColor Red
        Write-Host ""
        Write-Host "Removing Package"
        Remove-AppxPackage $Package
        $BloatPackages += 1
    }







    $Publisher = $Package.Name.Split(".")
    if ($Publisher -eq "Microsoft")
    {
        Write-Host $Package.Name -ForegroundColor Green;
    }
    else
    {
        Write-Host $Pacakge.Name -ForegroundColor Red;
    }
    Write-Host $Package.Name -NoNewline -ForegroundColor Magenta
    


}

Write-Host ""
Write-Host $BloatPackages " Were found, and removed!" -ForegroundColor Cyan
