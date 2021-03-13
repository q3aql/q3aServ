OSP Tourney DM/CA/CTF para Quake3
================================
Fecha:    14 Dec 01
Sitio:    http://www.OrangeSmoothie.org
Contacto: rhea@OrangeSmoothie.org
Versi�n:  1.0

====================================================
 Traducido al Espa�ol por el equipo Rancid:
====================================================
 - Pablo Gonz�lez 	alias Totoro
 - Roberto Konow 		alias Rat�n
 - Antonio Inocencio	alias Nyto
 - Mauricio Quilpatay 	alias Phobos

 WWW:		http://www.rancid.cl
 Email: 	webmaster@rancid.cl
 IRC:		#rancid on irc.enterthegame.com

 --> Visita www.rancid.cl para obtener noticias
     del E-Sport y Quake3 totalmente en Espa�ol.
====================================================
====================================================

Este documento explica los comandos avanzados del cliente 
y sus opciones en el  OSP Tourney DM/CA/CTF.

Problemas de Conexi�n/graficos:
==============================
Trata de setear el com_hunkmegs a 56 � 64 en tu q3config.cfg (busca 
por el valor actual en el archivo .cfg), autoexec.cfg or cualquier 
config que ejecute el cliente para entrar al juego.  Incluso puedes 
especificarlo en la l�nea de comando con: +set com_hunkmegs 56.

Definici�n de nombres:
======================
cg_* - Opciones Generales del cliente.
ch_* - Opciones relacionadas con el HUD del cliente.
cf_* - Opciones relacionadas con las letras (fuentes) del HUD.


Caracteres de control de Mensajes:
===========================
Los siguientes caracteres describen opciones adicionales que se 
pueden usar en los mensajes dentro del team,
nombres usando OSP, en el HUD o los mensajes MOTD.

^B y ^b - Hace que el Texto parpadee 
^F        - Hace que el texto solo se muestre en el primer medio segundo 
^f        - Hace que el texto solo se muestre en el ultimo medio segundo 
^N        - Resetea los comandos como ^B, ^F, ^f
^Xrrggbb  - Permite al usuario definir los colores usando valores rgb  (hex)

            (Ej: ^XFF0000 Es rojo, ^X777777 Es alg�n tipo gris).

Restricciones de valores
========================
Los siguientes valores est�n forzados para un juego en internet:

      r_lodcurveerror debe estar en 250
      r_subdivisions no debe ser mayor que 80
      cl_znear debe estar en 4
      cl_shownormals debe estar en 0
      cl_showtris debe estar en 0

Si tu tienes estos valores que violan cualquiera de estar reglas, OSP 
dejar� un valor aceptable para este comando y provocar� un vid_restart. 
Por otro lado este efecto hace parecer que el mapa cargue m�s de una vez 
al conectarse al servidor.

Otras alertas:

	cg_bobup restringido a +/- 0.005
	cg_fov el lim�te superior est� restringido a 120, a menos que
 	en la vista con zoom cg_zoomFov est� restringida a 120
	no existe la vista cg_thirdperson si se est� en el juego (y e
 	un server dedicado)



S�mbolos de chat disponibles
============================
#A - Armadura
	Valor de la armadura actual

#C - Muerte
	Locaci�n donde te moriste la ultima vez
	/say_team "#C invadida"

#D - Da�ado por
	�ltimo jugador que te infligi� alg�n da�o
	/say_team "#D est� aqu� y est� fuerte mente armado!" 

#H - Salud
	Valor de la salud actual
	/say_team "Estoy malherido - #H/#A"

#I - Item (m�s cercano disponible)
	Muestra el item m�s "significante" (arma, armadura, powerup, o
 	MH) disponible, y incluye los items tirados  :)
	/say_team "#I disponible aqu�"

#L - Locaci�n
	Muchos mapas tienen muchas marcas de locaciones ej: PG en PRO-
	DM6 muestra el YA
	"(pF.arQon) (YA): Arma disponible" es un poco mal, no?
	Esto muestra el m�s cercano "significante" item aparecido
	(arma, armadura, powerup, o 	MH),  si el item est� ahi o no

#M - munici�n esperada
	Lista todo los tipos de municiones para las armas que est�n
 	vac�as o casi vac�as (entre 0 y 5 de munici�n).
	/say_team "Necesito #M"

#P - Powerups
	Lista todos los powerups que tienes actualmente

#T - Target
	El �ltimo jugador al cual golpeaste
	/say_team "#T est� d�bil! - m�tenlo!"


Comandos del cliente
===============
currenttime
	Muestra la hora local.

menu
	Permite el ajuste de varias opciones y variables en el OSP.
 	Abajo	hay una descripci�n de los comandos importantes para 	poder
	utilizar esta opci�n en el juego. (nota: las palabras
 	entre "" son comandos de consola):
		- "menu" Habilita el men�
		- "weapprev" y "weapnext" para moverse de arriba o abajo
 		   en el menu (normalmente esta seteado a '[' y ']' por
 		   defecto).
		- "menuleft" y "menuright" para seleccionar opciones del
 	         men�, o para agregar o quitar valor a algunas
		   opciones.

		Es recomendado que bindear estos comandos: (es decir
		weapprev, weapnext, menuleft, menuright and menu) a
 			algunas teclas c�modas:
			bind / menu
			bind [ weapprev
			bind ] weapnnext
			bind ";" menuleft
			bind ' menuright

modif[1..5] stuff
        +modif[1..5] y -modif[1..5] soporta la opci�n para las
 	  personas que quieran un "doble bind" para m�ltiples
  	  secuencias, como en el siguiente ejemplo: 

	  set normkeys "bind 1 weapon 1; bind 2 weapon 2"
	  set altkeys  "bind 1 say_team nme incoming; bind 2 say_team                         			    la base est� segura"
	  +modif1 vstr normkeys
	  -modif1 vstr altkeys
	  bind shift +modif1
	
      Ahora cuando se dejes presionada la tecla SHIFT, +modif1 ser�
 	ejecutado. Cuando se suelte la tecla, el vsrt dirigido a
 		-modif1 ser� ejecutado. 
      En este ejemplo, presionar la tecla SHIFT va a bindear las
 	teclas 1 y 2 a las armas 1 y 2. Cuando  se suelte la tecla, las
 	teclas 1 y 2 estar�n bindeadas a "say_team viene el enemigo!" y
 	"say_team la base est� bajo ataque!".

	En el ejemplo pasado si presionas la tecla SHIFT y la sueltas y
 	despu�s presionas la tecla 1, va a dar como resultado "say_team
 	viene el enemigo!". 
      Presionando y MANTENIENDO la tecla SHIFT y presionar la tecla 1
 	va a cambiar a la arma 1. 

        usa  "\+modif1 ?" para ver que esta bindeado a +modif1 

+/-actions
        Este es la versi�n Q3comp de la misma idea:

	    Ejemplo:
	    set action1up "bind 1 weapon 1; bind 2 weapon 2"
          set action1down "bind 1 say_team nme incoming!; bind 2 
	    say_team base is safe"
          bind shift +action1

        Esto har� lo mismo que el ejemplo del comando "modif" 
        Puedes tener hasta 10 actions. (0-9)

+vstr [comando_bajo] [comando_alto]
      Otra manera util para crear scripts de cambio de armas. Aqu� hay un ejemplo:

         set shaft "weapon 6; wait 2; +attack"
         set unfire "-attack"
         bind mouse2 +vstr shaft unfire

+fire [weap_1] [weap_2] ...
      Especifica una cadena de armas para cambiar a y disparar, ej:

         +fire 5 3

      Cambia a y dispara el RL, si esta disponible, sino cambia a la SG y dispara
      sino ninguna acci�n ocurre (solo promode).

addstr [target_string] [source_string]
      Apunta [source_string] a [target_string] (solo promode)


Opciones Generales del Juego
============================
Las opciones generales del juego est�n en la categor�a cg_*.
Para la mayor parte de  las opciones del HUD (heads-up-display),
mira las opciones ch_* y  cf_*, listadas en las siguientes secciones.

cg_altGrenades <0|1> (defecto = 0 - skin de granadas baseq3)
      Utiliza una alternativa del skin/modelo para las granadas.

cg_altLightning <0|1> (defecto = 0 - nuevo 1.29/promode skin)
      Utiliza el skin original (pre 1.29) para el rayo de la
 	lightning gun.

cg_altPlasma <0|1> (defecto = 0 - skin de plasma baseq3)
      Utiliza una alternativa del skin/modelo para los disparos de la
 	Plasma Gun.

cg_ammoCheck <0|1> (defecto = 0 - deshabilitado)
      Deshabilita la posibilidad de cambiar a una arma que no tenga
 	municiones (ammo). �til para binds de m�ltiples-armas.

cg_autoAction <option_bitmask> (defecto = 0)
      Realiza acciones autom�ticas para ciertos puntos durante el
 	juego.

       <option_bitmask>:
             1 - Guarda autom�ticamente un texto al final de un
 			     Match. 
		 Estos Textos (Logs) ser�n guardados en:
                 
                   <osp_root>/stats/<date>/<logname>.txt

             2 - Toma un screenshot autom�ticamente al terminar un
 		     Match. 
             4 - Graba un demo autom�ticamente (requiere un servidor 
		     con warmup - g_warmup = 0)
             8 - Muestra las estad�sticas de las armas del tu equipo
            16 - Muestra las estad�sticas de las armas de los
 			     jugadores

cg_clientLog <valor> (Defecto = 0)
      Permite la opci�n de loggear desde el clientes. Un valor que no
 	sea cero de X (donde "X" es 1 o mayor) Habilita el loggeo de
 	todos los mensajes realizados durante el partido. Los colores y
 	tiempos tambi�n son incluidos!
      El log de cliente queda guardado en  	osp/client_logs/clientX.txt.

cg_Customloc <0|1> (Defecto  = 0 - deshabilitado)
      Usa informaci�n personalizada de los lugares (De Archivos que
 	est�n en el directorio locs/<mapname>.cfg). Para el teamoverlay
 	y el teamchat. Para agregar un lugar en especial para un mapa,
 	encuentre un sitio en particular y despu�s:
     
            \addpos <Nombre del Lugar>

      Se pueden usar todo tipo de colores o caracteres especiales en
 	el campo "Nombre del Lugar". Este punto de referencia ser�
 	agregado a locs\<mapname>.cfg todas las veces que una posici�n
 	sea agregada.

      Estos Lugares son cargados cuando se carga un mapa o cuando el
 	cliente hace "vid_restart". Si un archivo 'customloc' no se
 	encuentra para el mapa, la informaci�n de los lugares que ser�n
 	mostrados, van a ser los de defecto que vienen con el mapa.

cg_deadBodyFilter <0|1> (default = 0 - Muestra cuerpos muertos)
      Habilita/deshabilita el poder mostrar los cuerpos muertos en un nivel.
      
cg_drawDecals <0|1> (defecto = 1 - Habilitar el poner logos)
      Habilita o deshabilita el poder ver el logo en los mapas.

cg_enableOSPHUD <0|1> (defecto = 1 - habilitar el OSP-basado HUD )
      habilita el OSP-basado HUD.

cg_enemyColors <HSL> (defecto = 0000 (blanco))
      Especifica los colores para tus enemigos ,si se usa el skin 
      "pm" skins para los modelos:
          R = color de la rail (para cg_teamrails 2)
          H = color de la cabeza/casco
          S = color del Torso
          L = color de las piernas

----> Nota: Valores del "caracter" para cada par�metro "RHSL" puede
 ser desde 0-9,a-z
      
cg_enemyModel <nombre_del_modelo> (defecto = "" - inhabilitado)
      Dejar este comando va a forzar a todos los jugadores del equipo
 	enemigo a aparentar usar este modelo. Tus compa�eros de equipo
 	van a mantener sus modelos a menos que se use el comando
 	"cg_forcemodels 1" que fuerza todos los modelos a ser iguales.

cg_float <0|1> (defecto = 0)
      Permite un modo "flotante" de ver los resultados.

cg_followkiller <0|1> (defecto = 0 - inhabilitado)
      Permite al cliente cambiar autom�ticamente el asesino del
 	jugador actual.
      Recomendable para los Matches 1v1 y excelentes para los
 	espectadores de matches en equipo.

cg_followpowerup <0|1> (Defecto = 0 - Inhabilitado)
      Permite al cliente auto dirigirse al jugador que tomo un
 	powerup si se esta espectando. Los Flag carriers tienen mayor
 	importancia en el comando Follow_powerup. Una vez que est�s
 	espectando a un flag carrier, no ser� cambiado a menos maten a
 	este o que capture. Tambi�n, si el jugador actual que tenga el
 	powerup es asesinado, la c�mara ser� cambiada a otro jugador
 	con powerup, si este existe.

cg_followviewcam <0|1> (defecto = 1 - Sigue a un jugador en especifico)
      Permite el uso del modo din�mico o especifico de la viewcam en
 	un jugador en especifico

cg_forceColors <0|1> (defecto = 0 - Inhabilitado)
      Fuerza a todos los compa�eros de equipo a usar tus opciones de
 	colores, si se usan los skins "PM". 

cg_lagometer <0|1|2> (defecto = 1 - Abajo Derecha)
      Dibuja la cantidad de "lag" que el jugador siente (estado de la
 	red) en tiempo real.
          0 - Inhabilitado
          1 - Muestra en la parte de abajo a la derecha de la
 			  pantalla.
          2 - Muestra en la parte de arriba a la derecha de la
 			  pantalla.

cg_MaxlocationWidth <longitud> (defecto = 16)
      Setea el maximo locationlenght para el teamoverley y team chat. 

cg_nochatbeep <0|1> (defecto = 0 - Habilita los sonidos de chat)
      Permite al cliente a suprimir los "beeps" que se escuchan en un
 	mensaje normal de chat. Especialmente recomendado cuando se
 	esta conectado a un QTV server.

cg_nomip <bitmask> (defecto = 0 - todos los gfx siguen al r_picmip)
      Permite cambiar los gr�ficos a picmip 0, dependiendo del valor
 	del actual r_picmip .  Los par�metros para esta opci�n son un
 	bitmask:
           1 - Rayo de la LightningGun 
           2 - PlasmaGun bolt
           4 - Explosiones del Rocket Launcher
           8 - Explosiones del Grenade Launcher 
          16 - Balas (machinegun y shotgun)
          32 - Railgun
          64 - BFG
         128 - Marcas de sangre
	 256 - Estelas de humo

          Note: Si usas marcas, estas para cada arma ser�n seteadas a 
                picmip nivel 0.

cg_oldCTFSounds <0|1> (defecto = 0 - Usa los nuevos sonidos de CTF)
      Permite el uso de los sonidos antiguos para el tipo de juego
 	CTF, que fueron usados para las versiones antigua a la 1.27. 

cg_oldPlasma <0|1> (defecto = 1)
      Alterna entre el estilo viejo de la plasma gun de quake3 y 
      el nuevo grafico con part�culas.

cg_oldRail <0|1> (default = 1)
      Alterna entre el estilo viejo de la Railgun de quake3 y 
      el nuevo grafico similar a quake2.

cg_oversampleMouse <0|1> - (defecto = 0 - normal mouse sampling)
      Permite al cliente el uso pmove avanzado del mouse aun si
      el comando pmove_fixed esta forzado a 0 en el servidor. 

cg_q3compScoreboard <0|1> (defecto = 0)
      0 - Id tabla de resultados de defecto.
      1 - Tabla de resultados Q3comp.

cg_scoreTransparency <0.0 - 1.0> (defecto = 1.0 - Brillo)
      Ajusta el canal alfa de las letras en la tabla de resultados. 
      Mientras menor sea el valor, mas transparente ser� la tabla de
 	resultados.

cg_showPlayerLean <0|1> (defecto = 1 - Show model leaning)
      Permite deshabilitar animaci�n de salto, que fue introducida en
 	el parche 1.27.

cg_statscrolltime <value> (defecto = 0.15)
      Setea, en segundos, el tiempo que le toma a la ventana de
 	estad�sticas para moverse arriba y abajo Seteando a 0 fuerza la
 	accion on/off instant�nea.

cg_swapSkins <0|1> (defecto = 0 - colores normales del equipo)
      Permite revertir los colores de los skins como se muestran en
 	la pantalla.
      Nota: los anuncios, overlays, y el marcador mantendr� un "real"
      control del server en los colores del equipo.

cg_teamRails <0|1> (default = 0 - rail colors defined by players)
      Fuerza los colores de la estela de la railgun para que coincida 
      con el color del equipo de los jugadores que disparan.
      Solo funciona para modos de juego en equipos.

      0 - Color de la estela definido por cada jugador.
      1 - La estela de la rail va a coincidir con el color del equipo
 	    que dispara 
          (por ejemplo: Un jugador del equipo rojo siempre tendr� la
 	    estela de la railgun roja).
      2 - Usa el color de la rail como se especifica en el par�metro 
	    R del comando "color1" para compa�eros de equipo y
 		    par�metro R para "cg_enemycolors" para los del equipo
 	    enemigo. 

cg_truelightning <0.0 - 1.0> (Defecto = 0.0)
      Especifica el lag impuesto en el render del rayo de la
 	lightinggun. 
      Un valor de 0.0 ser� justo como sentir el lg igual a la versi�n
 	baseq3. 
      Un valor de 1.0 impondr�a ning�n lag en absoluto (el rayo
 	siempre estar�  
      pegado a la mira). Un valor de 0.5 es una buena mezcla para
 	reducir el efecto de "tallar�n-humedo", mientras que sigue
 	manteniendo concistendia donde el servidor actual ve el shaft.

cg_useScreenShotJPEG <0|1> (Defecto = 0 - Usar formato .tga para las screenshots)
      Permite el uso de screenshots en formato .jpg tomados con el
 	comando "autoscreenshot" o acci�n autom�tica del servidor.
          0 - Usa el formato .tga
          1 - Usa el formato .jpg 

color1 <RHSL> (defecto = 0000 (blanco))
      Especifica las variadas opciones de color para el jugador y los
 	compa�eros de equipo, si se utiliza un skin "PM" para un modelo
 	de quake3 por defecto:
          R = Color del centro de la rail (esto es para todos los
 		  modelos y skins)
          H = color de la cabeza/casco
          S = Color del torso
          L = Color de las piernas

color2 <char> (default = 0)
      Especifica el color del disco de la rail

----> Nota: Valores del "caracter" para color1/color2 pueden ser desde 0-9, a-z.

pmove_fixed <0|1> (defecto = 1 - Habilitado)
      Permite al cliente el uso de movimientos avanzados.
      Nota, el servidor tiene  que tener esta opci�n habilitada. 
      

Opciones del HUD del cliente  (requiere cg_enableOSPHUD en 1):
=================================================================
ch_ColorLocations <0|1> (defecto = 1)
        Cambia el color de las posiciones del teamoverlay a azul o rojo,
        Si el texto "red" o "blue' es encontrado en la posici�n.

ch_CrosshairColor <string> (Defecto = Blanco)
      uso: ch_crosshaircolor 0xRRGGBB|<color>
             <color>: white, black, red, green, blue, yellow,
 				    magenta, cyan, y grey.
     	Para valores RGB, ch_crosshaircolor 0xFF3377 va a obtener un
 	bonito y loco color como un ejemplo. Nota importante:
 	cg_crosshairHealth sobrepasa esta funci�n, debe estar
 	deshabilitada para usar esta funci�n.

ch_CrosshairNamesLeft <0|1> (defecto = 0)
	Si se habilita, dibuja los nombres bajo mira a la izquierda del
 	HUD arriba del chat del equipo.

ch_drawSpeed <0-2> (defecto = 0)
	0 - La velocidad actual del jugador no se muestra.
	1 - La velocidad actual del jugador se muestra arriba a la
 	    derecha, abajo del tiempo/fps
	2 - La velocidad actual del jugador se muestra en peque�o, y
    	    con fuente transparente justo abajo de la mira.

ch_drawFlagNames <0-5> (defecto = 0)
	0 - Defecto
	1 - Dibuja el nombre del jugador con la bandera (pero sin
 	    �conos)
	2 - Dibuja el nombre del jugador con la bandera y con �conos.
	3 - Dibuja el nombre del jugador con la bandera(pero sin
     	    �conos) en la esquina inferior derecha (barra de		
	    estad�sticas de Q3comp solamente)
	4 - Dibuja el nombre del jugador con la bandera y con iconos en
 	    la parte inferior derecha (barra de estad�sticas de Q3comp
 	    solamente)

ch_FilterLocationsTeamchat <0|1> (defecto = 1)
	Filtra los nombre de posiciones en el chat del equipo.

ch_InverseTeamChat <0|1> (defecto = 1)
	Invierte la ventana de chat del equipo. Si se habilita, los
 	mensajes que arriben ser�n escritos arriba de los dem�s.

ch_Obituaries <0|1> (defecto = 1)
	Dibuja los obituarios en la consola.

ch_Pickupitem <0|1> (defecto = 1)
	Dibuja los �conos y mensajes cuando se toma un �tem.

ch_StatusbarFormat <0|1> (defecto = 10)
         0 - Usara la  Barra de estado de id por defecto.
         1 - Usara la Barra de estado por defecto del OSP, que solo
 	       mostrar� munici�n, armas, salud, flagcarrier y armadura.
         2 - Lo mismo que 1, pero en adici�n muestra un grafico de
 		 municiones por arma.
         3 - Lo mismo que 1, pero en adici�n muestra un grafico de
 		 municiones por arma como n�meros.
         4 - Estilo CPM hud (como vq3)
         5 - Barras CPM de salud/armadura
         6 - estilo 3 CPM 
         7 - estilo 4 CPM 
         8 - estilo 5 CPM 
         9 - estilo 1 Q3Comp 
        10 - estilo 2 Q3Comp 
        11 - estilo 3 Q3Comp 
        12 - estilo 4 Q3Comp 

ch_TeamBackground <0|1> (default = 0)
	Deshabilita el fondo del team en la barra de estado y chat del
 	equipo.

ch_TeamchatOnly <0|1> (default = 0)
	Si se habilita , solo dibujara el team chat en la parte
 	inferior izquierda del HUD. 

ch_TeamCrosshairHealth <0|1> (default = 1)
	Si se activa, dibuja la salud y armadura de los jugadores del
  	mismo equipo debajo de la mira.

ch_Teamoverlay <string> (default = "p12n h/aw l")
	Espec�fica que items van a ser mostrado en el teamoverlay. Esto
 	se puede acomodar:
	
	Campos
	=======
	p - iconos de powerup ,a la izquierda
	12n - Acho del nombre del jugador.
	h - Salud del Jugador
	a - Armadura del Jugador
	w - Icono de la Arma 
	l - Locaci�n del Jugador 

	Todos los otros �tems que no se pueden agregar, ser�n
 	insertados entre medio del campo del jugador (ej. ' ' y '/').

ch_Weaponswitch <0-9> (defecto = 2)
	Valores
	=======
	0 - Estilo antiguo, Horizontal arriba del teamchat
	1 - Lo mismo que  0, Pero permanente
	2 - Vertical, Dibujado a lado derecho del HUD
	3 - Lo mismo que 2,Pero Permanente
	4 - Vertical, Dibujado al lado izquierdo del Hud.
	5 - Lo mismo que 4, Pero permanente y muestra el ammo de cada
 	    arma.
      6 - Estilo CPM Izquierdo
      7 - Estilo CPM Derecho
      8 - Estilo CPM Abajo
	9 - No muestra el cambio de arma (si tu no lo necesitas o si
 	    estas usando statusbarformat 2 o 3)



Opciones de la fuente del cliente (require cg_enableOSPHUD seteado a 1):
=========================================================================
Nota: Las letras son seteadas especificando el ancho y largo de caracteres
como deber�an aparecer. Como por ejemplo: set cf_Statusbar "24x48".
Esto dejara que cada car�cter o icono en la barra de estado sea de 24 
pixeles de ancho y 48 de alto.

cf_AmmoStatusbar <XxY> (default = 8x8)
	Dimensiones de la fuente mostrados con ch_statusbarFormat 2 o
 	3.

cf_CrosshairNames <XxY> (default = 16x16)
        Tama�o de las Crosshairnames .

cf_Following <XxY> (default = 12x12)
	Tama�o de fuente del Mensaje que sigue.

cf_Fragmsg <XxY> (default = 16x16)
	Tama�o de la fuente del mensaje de "You Fragged xxx".

cf_Scores <XxY> (default = 16x16)
	Tama�o de la fuente de la caja de puntaje en la parte inferior
 	derecha del HUD.

cf_Pickupstring <XxY> (default = 16x16)
	Tama�o de la fuente del texto del �tem tomado.

cf_Statusbar <XxY> (default = 48x48)
	Agranda o achica la barra de status si ch_statusbar esta en 1.

cf_Teamchat <XxY> (default = 6x16)
	Tama�o de fuente del teamchat.

cf_TeamCrosshairHealth <XxY> (default = 12x12)
	Tama�o de la fuente de la informaci�n de vida de la mira.

cf_Teamoverlay <XxY> (default = 7x17)
	Tama�o de la fuente del team overlay.

cf_Vote <XxY> (default = 12x12)
	Tama�o de la fuente del mensaje de votaci�n.

cf_WeaponName <XxY> (default = 12x12)
	Tama�o de la fuente de nombre del arma si ch_weaponswitch es 1.

cf_WeaponSwitch <XxY> (default = 32x32)
	Tama�o de la fuente de los gr�ficos del weaponswitch.


=============================
Seteos �tiles para el Cliente
=============================
Los clientes puede setear:

	set cg_predictItems 0

Para evitar acciones inesperadas y sonidos de "pickup" que pueden ocurrir
 aveces durante el per�odo de "warmup" (pre-calentamiento).


Usando el gancho:
=================
Si en el server est� disponible el gancho, setea:

	bind nombre_tecla +button5

Precionando y manteniendo nombre_tecla (ej. mouse3), tu gancho ser� lanzado
 y te tirar� cuando se enganche en un objeto. Para soltar el gancho, solo
 suelta nombre_tecla.


Tirando Items:
===============
Si est� configurado (o fue votado), los jugadores pueden tirar armas/municiones
 en TDM o CTF. El comando para tirar items es:

	\drop <nombre_item>

<nombre_item> puede ser cualquiera de los siguientes:

	sg	(Shotgun)
	gl	(Grenade Launcher)
	rl	(Rocket Launcher)
	lg	(Lightning Gun)
	rg	(Railgun)
	pg	(Plasma Gun)
	bullets	(qty: 50)
	shells	(qty: 10)
	grenades	(qty: 5)
	rockets	(qty: 5)
	lightning	(qty: 80)
	slugs		(qty: 10)
	cells		(qty: 30)

Los jugadores pueden opcionalmente tirar las banderas en CTF con el comando:

	\drop flag


Usando el ViewCam:
==================
Hay muchas maneras de usar el viewcam.  Para habilitarlo:
	- Tipea: \viewcam en la consola
	- Unirse: \team vc
	- Ciclo a trav�s de el cuando se est� en modo espectador

Este modo de funcionamiento siempre localizar� la mayor acci�n en en el mapa.
 Para moverse manualmente por las diferentes locaciones del viewcam, tipea:

	\vc_free

	----> Esta opci�n cambia el posicionamiento del viewcam entre
 		manual o autom�tico.

Tu puedes opcionalmente seguir a un solo jugador con este modo:
	\vc_follow

Para seguir a un jugador ESPECIFICO, tipea:
	\vc_follow [JUGADOR_ID|NOMRE_JUGADOR]

	----> Nota: tu puedes solo hacer un ciclo a trav�s de los
 jugadores precionando las teclas de saltar/agachar tambi�n.

Las posiciones del viewcam est�n definidas por un archivo de configuraci�n
que es del mapa en espec�fico. Si el mapa no tiene un archivo que define
el viewcam, el viewcam estar� deshabilitado para ser usado en el este mapa.

Crear definiciones de nuevos viewcam es super facil y tambi�n entretenido =
) Toda la documentaci�n que necesitaras (+ comandos adicionales) 
est� incluida en el archivo Docs/osp-q3-Viewcam.txt.
(Para espa�ol: Docs/ESP/osp-q3-Viewcam-ESP.txt).

Si tu haces archivos de definiciones para el viewcam que no estan incluidas
 en la distribuci�n de OSP, por favor m�ndalos a mi y yo los incluir� en el
 pr�ximo release. Por su puesto, todos los cr�ditos ser�n mostrados.


Feedback
========
Para comentarios, sugerencias, opciones requeridas, reportes de bugs:
   rhea@OrangeSmoothie.org