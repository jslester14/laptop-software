# Install WSL (Windows Subsystem for Linux)
wsl --install

# Define an array of application IDs to install via winget
$apps = @(
    "MuhammedKalkan.OpenLens",
    "Bitwarden.Bitwarden",
    "Bitwarden.CLI",
    "dbeaver.dbeaver",
    "Google.Chrome",
    "Helm.Helm",
    "Microsoft.SQLServerManagementStudio",
    "Microsoft.VisualStudio.2022.Professional",
    "Notepad++.Notepad++",
    "Postman.Postman",
    "Microsoft.DotNet.DesktopRuntime.7",
    "JanDeDobbeleer.OhMyPosh",
    "Python.Python.3.11",
    "Microsoft.PowerToys",
    "Kubernetes.kubectl",
    "Microsoft.Azure.Kubelogin",
    "Microsoft.AzureCLI"
)

# Loop through the array and install each app
foreach ($app in $apps) {
    Write-Host "Installing $app..."
    winget install --exact --id $app
}

# Install oh-my-posh
$env:Path += ";C:\Users\user\AppData\Local\Programs\oh-my-posh\bin"
oh-my-posh font 3270 Nerd Font
Install-Module -Name PSReadLine -AllowPrerelease -Scope CurrentUser -Force -SkipPublisherCheck
New-Item -Path $PROFILE -Type File -Force
"oh-my-posh init pwsh --config 'C:\Users\JLester\AppData\Local\Programs\oh-my-posh\themes\spaceship.omp.json' | Invoke-Expression" | Out-File -FilePath $PROFILE -Append
"Set-PSReadLineOption -PredictionSource History" | Out-File -FilePath $PROFILE -Append
"Set-PSReadLineOption -PredictionViewStyle ListView" | Out-File -FilePath $PROFILE -Append
"Set-PSReadLineOption -EditMode Windows" | Out-File -FilePath $PROFILE -Append

. $PROFILE
