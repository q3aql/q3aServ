
Challenge ProMode Arena
-----------------------
Date: 22 Sep 06

WWW: http://www.promode.org
IRC: #promode on irc.quakenet.org


Installation:

Unzip this archive in the root Quake3/ directory, with folders enabled.
You should have a newly created directory named "cpma" with these files:

readme.txt - this file
changelog.txt - a very terse list of additions, changes, and bugfixes
   it is however BY FAR the most important of the docs, so READ IT!
description.txt - the entry for the mods menu
z-cpma-pak<version>.pk3
docs/<various>.txt
and a few standard configuration dirs (modes, cfg-maps, classes, etc)

Note: you should NEVER change any of the files installed by CPMA: they
will almost certainly be overwritten by future releases. If you want
to customise things like modes, use a different name for your versions.

Read the docs. There's a lot of useful information in them.  :)
For quick start advice on player configs, see the end of this file.


To start up a DEDICATED CPMA server, just type:
-----------------------------------------------
quake3 +set dedicated 2 +set com_hunkmegs <n> +set sv_pure 1
       +set fs_game cpma +set vm_game 2 +exec <cfg-name>.cfg

----> IF YOU'RE UPGRADING FROM A PREVIOUS VERSION OF CPMA:
      Delete ALL old z-cpma-client-XXX.pk3 files in your server's
      cpma/ directory.  Dedicated servers should only have a single
      z-cpma-pakXXX.pk3 file in the cpma/ directory to prevent
      unnecessary .pk3 downloads and confusion (especially on
      Linux/BSD-based servers).

The value for com_hunkmegs really depends on how many clients you want
to support and the type of maps you're going to run.
For 1v1/FFA/TDM/CTF maps, 24-32 should be fine. For multiarena maps
like MAP-CPMAx and RA3MAPx you'll want to bump it to 48-64. 


To start up a LISTEN CPMA server (where a client and server
run in the same machine), type:
-----------------------------------------------------------
quake3 +set fs_game cpma +set vm_game 2

Note: You may also need to set sv_pure 0 for the listen server,
      if you experience crashes or Q3 decides to unload the mod
      on map changes: these are known bugs in the Q3 engine.


** Linux admins: Replace "quake3" with "q3ded" in the above examples.
**               Also make sure to add "+set fs_basepath <dir>" that
**               points to your root Quake3 directory to properly
**               enable server downloads.  Also, add a +set vm_game 2
**               to the command-line to ensure full compatibility.


This document was blatantly ripped off from the one Rhea wrote for OSP.  :)



-----------------------------
Config Tips - Getting Started
Swelt, 3 Jan 02
-----------------------------

All the info in here is taken from the Client.txt file in the cpma/docs/
directory.  This section is just intended to make getting started that little
bit easier.  Described below are a number of the most commonly used settings and
commands used by CPMA players.  At the end, we'll be putting this into a config
file... more on this later.

Models and skins:
-----------------
To start, you'll want to choose a model for yourself.  As in vQ3, the setting
is "set model [model]/[skin]".  CPMA has a set of special skins for better
visibility: to use these, choose your skins as "pm" (eg "set model doom/pm").
If you have chosen to use ProMode skins, you should now choose your colors.
The setting is "color", and has 4 numbers: [rail core] [head] [shirt] [legs].
So you could set your rail core to be green (2), head and shirt to be yellow (3)
and legs to be red (1) with this: "set color 2331".
Note that you can customise your own model setup in the game using the GUI.
Press Escape and choose Player Setup.  There you can customise your personal
colors, and see it as they change.

If you are playing team modes and want all your team mates to be the same color
as you, use the setting cg_forcecolors 1.  cg_forcemodel 1 will force your team
to use the same model as you.

Now that your own model and team are decided, you can set up how you want the 
opposing team to appear.  The command is cg_EnemyModel model/skin. To make 
the most out of this you should use ProMode skins - fullbright custom colour 
enemies rule! Again, select pm as the skin. You can customise the colour with 
cg_EnemyColors #### 

eg: 
cg_enemymodel keel/pm
cg_enemycolors iiii

Bright Green Keel sir? Suits you, sir!


The HUD (Heads Up Display):
---------------------------
This has a document all to itself these days: docs/HUD.txt


Weapon Stuff:
-------------
There are a few neeto little tweaks to the weapons. Most of these will again be 
familiar to those with OSP experience. 

cg_truelightning [Value 0 - 1]
Most people find that 0.5 allows them better LG aim on the net.  The same code
has now been used by id in Quake3.

cg_smokeradius_rl and cg_smokegrowth_rl
Customise the size of your rocket trails, or simply turn them off. Setting both
to 0 will completely remove the trail. You can do the same for the grenade trail
( _gl rather than _rl).


Misc. Stuff:
------------
Joining the game.  After connecting to a server, the next step depends on the
game type.  For most gametypes, you will initially spawn as a spectator.
To join the game, either press Escape and select a team or join game.
For multi arenas (maps with several seperate playing areas) hit escape and
select Choose Arena. The list of  arenas are marked DA for Duel Arena (1v1) or
CA for Clan Arena. If an arena has CPM in red after the name, this signifies
that it is using ProMode settings. Once you are in the arena you want to be,
hit escape again to select a team, or type /team r or /team b to join up.

CPMA uses specially tweaked prediction code, to offer the best gameplay online.  
There are two settings which were tweaks to vanilla Q3 which can interfere with
this.  In your config, you may find it best to set cg_smoothclients 0 and 
cl_timenudge 0

Configs:
--------
The easiest way to give Quake3 a bunch of config settings is to write a config 
file.  This is a simple text file which you can execute within the game to pass
quake3 all the settings it contains.  To create a new config file, create a new
blank text file and enter a list of settings.  Save this file in either the
baseq3 or cpma directory.  This file should end ".cfg".  For instance, I would
create a file called swelt.cfg.  To apply the settings in the config, type 
"/exec config" (eg exec swelt) at the console.  No need to type the ".cfg" at 
the end.  (Note thats swelt.cfg not swelt.cfg.txt - god bless MS)

For more advice on configs check one of these websites:
http://www.planetquake.com/thebind/
http://ucguides.savagehelp.com/Quake3/AquaQuake3Guide.html
http://netsites.barrysworld.net/guides/quake3/
_______________________________________________________________________________

The cpma/cfg directory includes a simplified version of arQon's config,
which is a good reference for some of the more technical settings: if you don't
understand what a certain cvar does or you aren't familiar with some of the
enhanced and new CPMA ones and don't want to look it up, odds are whatever is
in there is the best setting for it.  :)
If you're new to CPMA, you should probably use "exec cfg/arqon" FIRST to set up
some good defaults, then modify those rather than start from scratch.
