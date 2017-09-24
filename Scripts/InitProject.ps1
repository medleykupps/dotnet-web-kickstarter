Param (
    [Parameter(Mandatory=$True,Position=1)]
    [string] $projectName
)
#$projectName = "koowe.Profile"

Write-Progress -Activity "Renaming all project files..."  

$root = "C:\git\Personal\kickstarters\dotnet-web-kickstarter\Src\"

# Rename folders and files from KickStarter to $projectName
Get-ChildItem -path "$root*" -Recurse -Filter *KickStarter* | Rename-Item -NewName {$_.name -Replace 'KickStarter', $projectName}

# Search for KickStarter inside C# files
Get-ChildItem "$root" -Recurse -Include *.cs | `
    ?{ -not $_.PSIsContainer } | `
    Select-String -pattern "KickStarter" | ` 
    Select-Object -unique path | `
    ForEach { @{Path = $_.Path;Content = (Get-Content($_.Path)) -replace "namespace KickStarter", "namespace $projectName";} | `
    % {Set-Content $_.Path $_.Content } }

Get-ChildItem "$root" -recurse -Include *.cs, *.cshtml `
    | ?{ -not $_.PSIsContainer } `
    | Select-String -pattern "KickStarter" `
    | Select-Object -unique path `
    | ForEach { @{Path = $_.Path;Content = (Get-Content($_.Path)) -replace "using KickStarter", "using $projectName";} `
    | % {Set-Content $_.Path $_.Content } }

Get-ChildItem "$root" -recurse -Include *.cs, *.cshtml `
    | ?{ -not $_.PSIsContainer } `
    | Select-String -pattern "KickStarter" `
    | Select-Object -unique path `
    | ForEach { @{Path = $_.Path;Content = (Get-Content($_.Path)) -replace "KickStarter", "$projectName";} `
    | % {Set-Content $_.Path $_.Content } }
