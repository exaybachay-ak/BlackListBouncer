# BlackListBouncer
Platform-independent blocking of known bad networks and hosts (bulletproof providers and known malware/bots)

# Goals:
(Inward goal)  Prevent undesirable traffic from reaching your computer from the Internet, if the script detects your system being accessible from the Internet.
(Outward goal) Prevent your system from communicating with known bad hosts, such as Tor nodes, bulletproof hosting providers like OVH, bots, and any other threat feeds of attackers like Greensnow.co, Cymon, OTX, etc..

The main goal is to be able to prevent systems you own from either being attacked successfully with brute force cracking attacks or exploits, or to prevent communication back to hosts that are known as being attached to malicious activity or code.  This is not, of course, meant to be the end-all be-all solution to keep your system from getting infected or owned.  It is, instead, meant to be a tool that integrates into an overall defense-in-depth strategy.

Primarily the idea up because of other software I'm working on that will attempt to crack user passwords using known/extremely common combinations without actually hitting any brute-force limits.  My thought was that instead of just waiting for repeated failed attempts, why not just block logons from hosting providers in the first place?  Most employees or legitimate users should be logging on from basically everywhere else other than hosting provider platforms.

# Functionality 
Functionality should be simple.  Run this script.  If something goes wrong, turn it off.  If you know what you are doing, add IP addresses to an exclusions list once you've vetted them and know they are not a threat.  My idea is for this to be dead-simple, and an effective mitigation against NON-TARGETED threats.  This should be an effective means of blocking incoming brute-force password cracking from botnets and malware that is tossing exploits around, as well as preventing your system from going out and connecting to Command and Control systems or other known malicious systems/networks. 

# Full Disclosure / Props:
The idea came to me naturally, but is incorporates this awesome utility I found a while ago:
https://github.com/BinaryDefense/goatrider/blob/master/goatrider.py
https://github.com/hslatman/awesome-threat-intelligence
