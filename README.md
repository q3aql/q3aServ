q3aServ - Create a Quake 3 server easily on Linux
=================================================

### Dependences:

  * Quake 3 Engine -> [https://ioquake3.org/](https://ioquake3.org/)
  * OSP Mod `(Included)` -> [http://www.moddb.com/mods/osp/downloads/osp-mod-103a-full](http://www.moddb.com/mods/osp/downloads/osp-mod-103a-full)
  * CPMA Mod `(Included)` -> [https://www.playmorepromode.org/](https://www.playmorepromode.org/)
  * Quake 3 Base -> [http://store.steampowered.com/app/2200/Quake_III_Arena/](http://store.steampowered.com/app/2200/Quake_III_Arena/)
  * Extra maps `(Included)` -> [https://www.lvlworld.com/](https://www.lvlworld.com/)

## Previous steps:

  * Copy all files and folders in root folder of the game.
  * Edit the file `q3aServ.sh`.
  * Change the following variables to the appropriate ones in your case:
  
    - `RUN_PATH="/opt/Games/quake3"`
    - `RUN_BINARY="ioq3ded.x86_64"`
    - `STATUS_PATH=/var/www/html/quake3/status.txt`

- Finally, execute the script with the appropriate parameters:
  
    - `$ ./q3aServ.sh <option> [1-5]`
    
### Sintax (Basic):

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
    
* Default settings of basic mode are the following:

    - `BOTS_LEVEL="2"`
    - `MIN_PLAYERS="5"`
    - `TIME_LIMIT="25"`
    - `FLAGS_LIMIT="10"`
    - `FRAGS_LIMIT="150"`
    - `TOU_FRAGS_LIMIT="50"`
    
_Note: You can change this settings editing the file `q3aServ.sh`._
    
## Sintax (Custom Game):

    $ ./q3aServ.sh CG

    Syntax: q3aServ.sh CG [map-selection] [gametype] [minplayers] [bot-level] [time-limit] [flags/frags-limit]

    Available options:

    * map-selection -> 1-5
    * gametype -> CTF/FFA/TD/TOU/FT/CTFI/TDI/FFAI/CA/CAI
    * minplayers -> 0-10
    * bot-level -> 1-5
    * time-limit -> 0-999
    * flags/frags-limit -> 0-999

    Abbreviations:

     CTF  = Capture The Flag
     FFA  = Free For All
     TD   = Team Deathmatch
     TOU  = Tournament
     FT   = Freeze Tag TD (OSP)
     CFTI = Capture The Flag Instagib (OSP)
     TDI  = Team Deatchmatch Instagib (OSP)
     FFAI = Free For All Instagib (OSP)
     CA   = Clan Arena (OSP)
     CAI  = Clan Arena Instagib (OSP)
