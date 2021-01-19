<div align="center">
<h1> Powershell for Everyone </h1>

<sub>Author: Santosh Rai
<small> January, 2021</small>
</sub>

</div>

* Get All Task Schedule with Powershell
  
```ps1
Get-ScheduledTask

```

* Create Task Schedule with Powershell

```ps1
$action = New-ScheduledTaskAction -Execute 'Powershell.exe' `

  -Argument '-NoProfile -WindowStyle Hidden -command "& {get-eventlog -logname Application -After ((get-date).AddDays(-1)) | Export-Csv -Path c:\fso\applog.csv -Force -NoTypeInformation}"'

$trigger =  New-ScheduledTaskTrigger -Daily -At 9am

Register-ScheduledTask -Action $action -Trigger $trigger -TaskName "AppLog" -Description "Daily dump of Applog"

```

* Delete Task Schedule with Powershell
  
```ps1
Unregister-ScheduledTask -TaskName applog -Confirm:$false

```