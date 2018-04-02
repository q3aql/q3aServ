q3aServ - Create a Quake 3 server easily on Linux
=================================================

* Dependences:
--------------

* Quake 3 Engine -> https://ioquake3.org/
* OSP Mod -> http://www.moddb.com/mods/osp/downloads/osp-mod-103a-full
* CPMA Mod -> https://www.playmorepromode.org/
* Quake 3 Base -> http://store.steampowered.com/app/2200/Quake_III_Arena/
* Extra maps -> https://www.lvlworld.com/

Note: All the maps used by me are in the file "maps.txt"

* How to use
-------------

- Copy all the files and folders in the root folder of the game.
- Edit the file "q3aServ.sh".
- Change the following variables to the appropriate ones in your case:
	
	RUN_PATH="/opt/Games/quake3"
	RUN_BINARY="ioq3ded.x86_64"
	STATUS_PATH=/var/www/html/quake3/status.txt
	
- Finally, execute the script with the appropriate parameters:
	
	$ ./q3aServ.sh

	Quake 3 Server Script v4.1

	Config.files: /opt/Games/quake3/server/*.cfg
	Log.files: /home/q3aql/.q3a/baseq3/*.log
	Status: /var/www/html/quake3/status.txt

	Syntax: q3aServ.sh <option> [1-5]

	Available options:

	CTF - Start Capture The Flag
	TD  - Start Team Deathmatch
	FFA - Start Free For All
	TOU - Start Tournament
	CG  - Custom Game
	CL  - Clear Logs
	ST  - Stop Current Server
		
* Custom Game
-------------

$ ./q3aServ.sh CG

Syntax: q3aServ.sh CG [map-selection] [gametype] [minplayers] [bot-level] [time-limit] [flags/frags-limit]

Available options:

* map-selection -> 1-5
* gametype -> CTF/FFA/TD/TOU/FT/CTFI/TDI/FFAI
* minplayers -> 0-10
* bot-level -> 1-5
* time-limit -> 0-999
* flags/frags-limit -> 0-999

Abbreviations:

- CTF  = Capture The Flag
- FFA  = Free For All
- TD   = Team Deathmatch
- TOU  = Tournament
- FT   = Freeze Tag TD (OSP)
- CFTI = Capture The Flag Instagib (OSP)
- TDI  = Team Deatchmatch Instagib (OSP)
- FFAI = Free For All Instagib (OSP)







