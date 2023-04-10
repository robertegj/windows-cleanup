Get-AppXPackage | where-object {$_.name –notlike “*store*”} | Remove-AppxPackage
Get-AppxPackage -Name "Microsoft.WindowsStore" | Remove-AppxPackage
Get-AppxPackage -Name "Microsoft.todos" -AllUsers | Remove-AppxPackage -AllUsers
(New-Object -Com Shell.Application).
    NameSpace('shell:::{4234d49b-0245-4df3-b780-3893943456e1}').
    Items() |
  %{ $_.Verbs() } |
  ?{$_.Name -match 'Un.*pin from Start'} |
  %{$_.DoIt()}
  
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
choco install -y vscode
choco install -y python
