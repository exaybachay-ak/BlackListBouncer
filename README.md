# BlackListBouncer
Block known bad networks and hosts (bulletproof providers and known malware/bots) from cracking your passwords/accessing your system remotely, or from successfully exploiting holes in your software.  If your system does become compromised, this should then be limit the damage by preventing communications back to C2 domains/hosts.

# Goals:
*(Inward goal)*  Prevent undesirable traffic from reaching your computer from the Internet, if the script detects your system being accessible from the Internet (potentially just run traceroute and look for presence of private ip addresses on the first hop).

*(Outward goal)* Prevent your system from communicating with known bad hosts, such as Tor nodes, bulletproof hosting providers (like OVH), bots, and any other threat feeds of attackers like Greensnow.co, Cymon, OTX, etc..

The main goal is to be able to prevent systems you own and/or administer from either being attacked successfully with brute force cracking attacks or exploits, and/or to prevent communication back to hosts that are known as being attached to malicious activity or code.  This is not, of course, meant to be the end-all be-all solution to keep your system from getting infected or owned.  It is, instead, meant to be a tool that integrates into an overall defense-in-depth strategy.

Primarily the idea came up because of other software I'm working on that will attempt to crack user passwords using known/extremely common combinations without actually hitting any brute-force limits.  My thought was that instead of just waiting for repeated failed attempts, why not just block logons from hosting providers in the first place?  Most employees or legitimate users should be logging on from basically everywhere else other than hosting provider platforms.  Conversely, many cracking setups are hosted on Amazon or other VPS-type hosting platforms (attackers don't want to launch attacks from addresses which could tie back to them somehow.)

# Functionality 
Functionality should be simple.  Run this script.  If something goes wrong, turn it off.  If you know what you are doing, add IP addresses to an exclusions list once you've vetted them and know they are not a threat.  My idea is for this to be dead-simple, and an effective mitigation against NON-TARGETED and semi-targeted threats.  This should be an effective means of blocking incoming brute-force password cracking from botnets and malware that is tossing exploits around, as well as preventing your system from going out and connecting to Command and Control systems or other known malicious systems/networks. 

# Full Disclosure / Props:
The idea came to me naturally, but it incorporates this awesome utility I found a while ago, as well as this awesome OSINT collection:
https://github.com/BinaryDefense/goatrider/blob/master/goatrider.py
https://github.com/hslatman/awesome-threat-intelligence
