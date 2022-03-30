# Open Remote Desktop without prompt screen

# To Disable prompt of password 
# - add TERMSRV to the /generic switch.

Param(

    [Parameter(Mandatory=$true)] [string]$Server,
    [Parameter(Mandatory=$true)] [String]$User,
    [Parameter(Mandatory=$true)] [string]$Password

   )

try{
    # search the credential
    cmdkey /list | ForEach-Object{if($_ -like "*target=TERMSRV/*"){cmdkey /del:($_ -replace " ","" -replace "Target:","")}}
    echo "Connecting to " + $Server

    # save the credential
    cmdkey /generic:TERMSRV/$Server /user:$User /pass:$Password

    # open remote desktop
    mstsc /v:$Server
} catch {
    echo ""
    echo "Connection Error"
    echo ""
    exit 1
}
