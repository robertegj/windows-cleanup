# Remove apps
Get-AppXPackage | where-object {$_.name –notlike “*store*”} | Remove-AppxPackage
# Remove Store
Get-AppxPackage -Name "Microsoft.WindowsStore" | Remove-AppxPackage
# Remove Todo app
Get-AppxPackage -Name "Microsoft.todos" -AllUsers | Remove-AppxPackage -AllUsers
# Remove pinned apps
(New-Object -Com Shell.Application).
    NameSpace('shell:::{4234d49b-0245-4df3-b780-3893943456e1}').
    Items() |
  %{ $_.Verbs() } |
  ?{$_.Name -match 'Un.*pin from Start'} |
  %{$_.DoIt()}
