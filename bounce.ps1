<#    #Powershell blackhole script
          Just run this script and it will re-route potentially malicious traffic to null
          In order to verify this, try run a to traceroute to 210.204.167.121
            Your traceroute should route to null because this software has configured a rule to force specific outbound
            traffic to the localhost bitbucket
          If you want to un-do the changes, select the reverse changes option and it will roll things back.  If something
          went wrong and the rules are "stuck" on, then re-run this script with the -undo switch.  This will go in and
          remove any settings that the script would have implemented, basically by running the script in reverse.
  
      #NOTE: At least half of the credit should go to Dave Kennedy and @BinaryDefense for making GoatRider.  
             Although the main component is the idea of re-routing to null, and the ease of use, GoatRider was what brought it all together
  

      #Primary powershell command
      New-NetRoute -DestinationPrefix "152.195.54.20/32" -InterfaceIndex 1 -NextHop 127.0.0.1

      #OSINT Threat Sources:
      https://www.esentire.com/news-and-events/press-releases/esentire-launches-largest-open-source-threat-intelligence-aggregator/
      https://github.com/hslatman/awesome-threat-intelligence
      http://osint.bambenekconsulting.com/feeds/c2-ipmasterlist.txt
      http://blocklist.greensnow.co/greensnow.txt
      https://intel.criticalstack.com/user/sign_up
      https://github.com/BinaryDefense/goatrider/blob/master/goatrider.py
      *more to be added later*

      #Known hosting platform IP blocks
      http://docs.aws.amazon.com/general/latest/gr/aws-ip-ranges.html
      http://www.senderbase.org/lookup/org/?search_string=OVH%20SAS
      
#>

#Retreive blacklist hosts from various sources
$greensnow = (invoke-webrequest -URI "blocklist.greensnow.co/greensnow.txt" -UseBasicParsing -TimeoutSec 60)
$bambenek = (invoke-webrequest -URI "osint.bambenekconsulting.com/feeds/c2-ipmasterlist.txt" -UseBasicParsing -TimeoutSec 60)
$alienvault = (invoke-webrequest -URI "https://reputation.alienvault.com/reputation.unix" -UseBasicParsing -TimeoutSec 60)


#Echo all ip addresses out into a full blacklist file, using regex to only get ip addresses
$greensnow.rawcontent > blacklist.txt
$banbenek.rawcontent >> blacklist.txt
$alientvault.rawcontent >> blacklist.txt

#Use the new-netroute command to blacklist IP addresses
#$blacklist | %{ New-NetRoute -DestinationPrefix "$_/32" -InterfaceIndex 1 }
$blacklist = get-content blacklist.txt | select-string -pattern "^[0-255]{3}"

function Block-Hosts
{
  $blacklist | %{
    New-NetRoute -DestinationPrefix "$_/32" -InterfaceIndex 1 -NextHop 0.0.0.0
  }
}

function Unblock-Hosts
{
  $blacklist | %{
    Remove-NetRoute -DestinationPrefix "$_/32" -Confirm:$false
  }
}

clear
write-output "What would you like to do?"
write-output ""
write-output "1. Blacklist everything!"
write-output "2. Crap I messed everything up, UNBLOCK IT!!!"
write-output "============================================="

$userresponse = Read-Host -Prompt 'Your Choice:'

if($userresponse -eq "1"){
  Block-Hosts
  return
}

if($userresponse -eq "2"){
  Unblock-Hosts
  return
}

else{
  write-host "You did something weird"
  return
}
