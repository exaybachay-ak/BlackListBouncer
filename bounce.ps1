<#    #Powershell blackhole script
          Just run this script and it will re-route potentially malicious traffic to null
          In order to verify this, try run a to traceroute to 64.182.208.181 (<-- update this address later)
            Your traceroute should route to null because this software has configured a rule to force specific outbound
            traffic to the localhost bitbucket
          If you want to un-do the changes, select the reverse changes option and it will roll things back.  If something
          went wrong and the rules are "stuck" on, then re-run this script with the -undo switch.  This will go in and
          remove any settings that the script would have implemented, basically by running the script in reverse.
  
      #Program flow:
      To bounce malicious inbound/outbound traffic:  Run bounce.ps1
      To undo change made previously by this script: Run bounce.ps1 -undo
      
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
