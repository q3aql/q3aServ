OSP Tourney DM/CA/CTF for Quake3
================================
Version: 1.01
Date:    18 Dec 01
Site:    http://www.OrangeSmoothie.org
Contact: rhea@OrangeSmoothie.org

----------
������Ա��
----------
��Ҫ��ƿ����ˣ�
	Jason "Rhea" Keimig (rhea@OrangeSmoothie.org)

����������Ա��
	Sander "Dessignator" Brandenburg (dessignator@OrangeSmoothie.org)
	Kevin "arQon" Blenkinsopp (arqon@promode.org)
	Harvey "]R[Papa" Morris (papa@reactivesoftware.com)
	Jens "Khaile" Bergensten (khaile@www.com)
	Michael "PhaNToM" Billing (phantom@promode.org)
	CPM������ְԱ

��ͼ��Ƽ����к�1.0�汾��ͼ�йص���Ҫ����ˣ�
	Christian "SHoD" Farcy (shod@noos.fr)

��ͼ���Ա��
	Christian "SHoD" Farcy - ospdm1/2/3 - (shod@noos.fr)
	Nicolas "Nunuk" Bouvier - ospdm2 - (nunuk@planetquake.com)
	Benoit "Bal" Stordeur - ospdm3 - (Bal@planetquake.com)
	Todd "Mr.CleaN" Rose - ospdm4 - (mrclean@planetquake.com)
	Scotty "Teddy" Drader - ospdm5 - (sdrader@home.com)
	�g�st "DruZli" Atlason - ospdm6 - (drusla@simnet.is)
	Jerry "clem" Dent - ospdm7 - (jed@verio.net)
	German "JaLisK0" Garcia - ospdm8 - (JaLisk0@terra.es)
	"Charon" - ospdm9 - (charon@atlantacon.org)
	Paul "Polo" de Rosanbo - ospdm10 - (polo2ro@fragdome.com)
	Roeland "Geit" Scheepens - ospdm11 - (ouwegeit@goat.gamepoint.net)
	Jeremy "random" Eaton - ospdm12 - (jeremy.eaton@telus.net)
	David "SgtGhost" Levesque - ospca1 - (sgtghost@hotmail.com)
	Rich "Publius" Tollerton - ospctf1 - (rtollert@tranquility.net)
	Daniel "Drunken Boxer" Lanicek - ospctf2 - (dlanicek@yahoo.com)

Voodooϵͳ:
	"myrddin" (myrdd1n@hotmail.com)

OSP���������ù��߿�����Ա��
	Greg "phred" Price (greg@price.org)

��װ�������Ա��
	Tim "Gouki" Pearson (gouki@clanavl.com)

OSP ��ҳ:
	"myrddin" (myrdd1n@hotmail.com)
	Tim "Gouki" Pearson (gouki@clanavl.com)




*** ���汾OSP֧��1.30���ϵ�Quake3

OSP������Ŀ����Ϊ�˱������������о����ԡ���Ϊһ��MOD��
OSP����ʹ��Һͷ���������Ա��Quake3�в������Ӽ򵥺ͱ�����
������û�иı��κ�Quake3�ĺ��ı��ʣ����еĺ������ݶ���
Quake3Ĭ�ϵġ�


OSP�����°汾��0.99c�����߰汾����Challenge Pro Mode
(http://www.challenge-world.com/promode/)���������á�
CPM����Һ��Թ��߽Ƕȳ�����Ϊ��ʹQ3���Ӽ��Ҷ�С�ĵ�
�ı���һЩQ3��һЩ�������ԡ��������������ΪQ3
�����˺ܶ�����Ȥ���������֪���ı���������ԣ���ο�
DocsĿ¼�µ�CPM-changes.txt��

OSP���µ���������ı���Ϣ�������http://www.q3acn.com��ã�
�������������cat@q3acn.com��ϵ��

============
���ٿ�ʼ
============
��osp-quake3-<version>.zip�ļ���Ŀ¼��ѹ��Quake3Ŀ¼�£�
������һ��"osp"Ŀ¼��������INSTALL.txt�ļ������г�������
�ļ���

Ҫ����һ��ר��OSP��������DEDICATED OSP server����ֻҪ���룺
----------------------------------------------

��С�ͷ�������
quake3 +set dedicated 2 +set com_hunkmegs 16 +set fs_game osp +exec <cfg-name>.cfg

�����ͷ�������
quake3 +set dedicated 2 +set com_hunkmegs 32 +set fs_game osp +exec <cfg-name>.cfg

----> �������ǰ�汾OSP����������
      ɾ���������osp/Ŀ¼�µ�����z-osp-cgameXXX/extra/players.pk3�ļ���ר��
      ��������osp/Ŀ¼��Ҫֻ��һ��z-osp-cgameXXX.pk3�ļ���������
      ���ҺͲ���Ҫ��.pk3�ļ����ر��ǻ���Linux/BSD�ķ�������


Ҫ����һ��LISTEN OSP����������Ϊ�ͻ�����Ϊ�������ģ���һ������������
�ķ������������룺
----------------------------------------------------------
quake3 +set fs_game osp +exec cfg-SinglePlayer/<cfg-name>.cfg

ע�⣺�����Ҫ����һ��listen�����������Ƽ���Ӧ�ý�osp/paks/Ŀ¼�µ�
      z-osp-gameXXX.pk3�ļ�������osp/Ŀ¼�¡�ͬʱ��ɾ��osp/vm/Ŀ¼��
      ����㾭������ͼ���������������磺������ʱ�����������������
      Ҳ���Խ�sv_pure����Ϊ0������listen��������

**
** LINUX/BSD�����ߣ���������������"q3ded"������"quake3"��ȷ�����ӣ�
**                        +set fs_basepath <dir> +set fs_cdpath <dir>
**		    �⽫ָ�����Quake3��Ŀ¼��ʹ����������ȷ���ء�ͬʱ
**		    ����+set vm_game 2����������ȷ����ȫ�ļ����ԡ�
** 		    


=======
��ϸ����
=======
������Quake3��Ĭ�Ϸ�ʽ�м����˺ܶ����ԣ�

- ��ǿ�����ķ�����ͨ�����׼�������ͬ����ʼ���������б���ģʽ��

- �������Ϸģʽ��"Clan Arena"�����侺���������CA����һ����
  �����������RocketArena�����Ƶ�Quakeģʽ��

- "Challenge Pro Mode" (CPM)��һ�ָ��졢�����ҵ���Ϸ��ʽ���������
  ������Ϸģʽ��ʹ���������ԡ�

- �����ԵĿͻ�������䡪��������ʹ�ö���HUD����ǿ�Ŀͻ�����֤��
  �Զ�¼��/��ͼ�ȡ�

- ��������ģʽ�����е�15���µ�ͼ��

- voodoo������/�ͻ��˵�log����ϵͳ��

- OSP���������ù���

- ���ӽǵ��Թۡ�OSP֧���Թ�����ͬһʱ��������Ļ���Թ۶������ӽ�

- �����Թ�ģʽ��ViewCam�����ַ�ʽ����ʹ����һ�ֵ�Ӱ��ͷ������ۿ�
  �������Ӷ����һ�����õĹ�սЧ��

- ���ÿ����Ϸ��ʽ����ս����������ӡ�����Ͳ��侺�������в�ͬ��
  �ḻ����Һͱ�����״̬������ͳ����Ϣ��

- �������˿ɶ���ġ���ͼ����16���Զ���ͼ�κ�32����ͼ���Ա�����ÿ����ͼ�С�

- ��Q3Comp�н���ĺܶ�Ľ���

- ���������Թ��ߡ������Ժͱ�ָ���Ķ����Ա��̸��Ϊ�����ж��������
  �ۿ���Ա�ж��ȡ�

- ���Ĺ��˹��ܣ�����ʹ���������������ɵ�ͨ����ҵ�������IP��ַ��
  �������ܾ�����������������ȻҲ����ͨ����ЩҪ����ָ�����������
  ����ҡ�

- �Ƚ��ġ������Ե�ͶƱϵͳ

- ��̬�ĵ�ͼ�б�����ϵͳ�������������µ�ͼ�ļ������غ󣬿��Է��㡢
  ���ٸı��������ͼ���á�

- ���Կ��ٹ۲���ҳɼ������״̬����

- ģʽ����ͶƱ��ʽ������ҿ���ͨ��ͶƱ�ı�����ģʽ��������֧��
  ������ģʽ��

- �µ�Զ�̿������

- �����������Ͷ�Ա�Ķӳ�����

- �������������ͷ�������塢�Ȳ�����ɫ����������������ɫ���Ը���
  ��ͬ!һ����10����ɫ���Ա��������á�

- ����п����������鲻���Թۣ��Ӷ���֯������Ե�й¶���ͱ��Է�����
  ����ͨ�ŵȹ���������Լ��������ڵ�λ�á���������Ϣ��

- ֻ���Թۺ�ӻ����ӵĹ���

- ����Ϸ���У��Զ����·�����������Ϣ�����������ʣ��ʱ�䡢�ȷֵ�
  ��Ϣ����������������GameSpy�ȹ���ˢ��ʱ�����Ի�ñ�����������Ϣ��

- ���ּ�ʱ����ʽ��

- ������ͣ���ܣ����Ա����кͶӳ���ִ�У�

- ��ѡ��Ķ��ַ�ץ����

- ��������Ʒ/�������ι��ܡ�

- ��Ʒ�滻���ܡ�

- �����"skunk"����ģʽ��

- �ڷ�����Ϊq3tourney3��������ӷ�ʽ��

- �����Լ�������������MOTD��

- ���Զ����ڿͻ�����ʾ��ָ����ͼ�Ρ�

- ���/����ģʽ�¿��ӳ���Ʒ��ѡ��

- ��ѡ��Q2����ϵͳ��

- ����·���õ�״���¿��Ի�����á��о����ĵ�ǹЧ���Ŀͻ�������

- �����������ÿ������������Զ���õ�����/�ӵ���

- ����������ҿ�ʼʱ��������

- ��¼�Ǹ���ϸ�ĸ�����Ϣ

- ������idĬ����Ϸ��ʽ�е����ȱ��

- �޷�ö�ٵĶ����ϸС�ĸĽ�

- ���İ汾��˵���ĵ������֣�

- ���İ汾��˵���ĵ������֣�


======================
      ��¼
======================
1. ��Docs/Ŀ¼��������ҵ���OSP���еĸ������ݣ���osp-q3-History.txt
   ���ҵ������������˲���������ͣ���osp-q3-Variables.txt�У���
   �Լ�����������ͣ���osp-q3-Commands.txt�У�

2. ���������������÷���������Ը��������Ҫ�������ʵ����޸ġ�

3. ��Ҫ��ÿͻ��˵������������������OSP���������ڿ���̨���룺

	\help

4. ��Ҫ������в�����������ڻ�ò���Ȩ�޺��ڿ���̨���룺

	\ref
��	\r_help

5. ��Ҫ�������ͶƱѡ������ڿ���̨���룺

	\callvote ?

6. ���Ҫ�����������ͶƱѡ������ã��Լ���ѡ����÷���������
   ����̨���룺

	\callvote <option_name> ?

   ����������ʾ��<option_name>���÷������ڷ����������á���������
   Ҫ�������ڷ������˶������Ƿ�������Σ��ڿ���̨���룺

	\callvote quad ?

���Ի�ã�

	Usage: \callvote quad <0|1>
        Enables/disables Quad Damage powerup availability

      Quad Damage is currently ENABLED
    ��˼�ǣ�
        �÷��� \callvote quad <0|1>
        ʹ��/�������񻷵�ʹ��

       ���ڿ���ʹ������
=======================
  �ͻ������õ�����
=======================
��ȻOSP Tourney DM/CA/CTF���Ա�����һ����ȫ�ķ�������ģʽ�����У�
ʹ�ͻ��˿����кܶ����õ�ѡ�����ã����忴osp/docs�µ�osp-q3-ClientReadme.txt
�ļ��������ǣ������������һ�������������ϸ����У�
������һЩ���԰�������ǿ��Ϸ�Ŀͻ������á�

�ͻ������ã�

	set cg_predictItems 0

��������ʱһЩ�ڱ��������ڼ���ܷ�������Ʒ������ʰȡ�������ر����ڶ����У�

ʹ�÷�ץ��
---------------
�������������ʹ�÷�ץ��������

	bind key_name +button5

����סkey_name��������mouse3��ʱ����ķ�ץ���ᱻ���䣬����ץסĿ���
���������ж������ɿ���ץʱ��ֻҪ�ɿ�key_name�����ɡ�

�ӳ���Ʒ��
--------------
������ã���ͨ��ͶƱͨ���������������ӻ�������ӳ�����/�ӵ���
�ӳ���Ʒ�������ǣ�

	\drop <item_name>

<item_name> ����Ϊ������Ʒ
	sg	(Shotgun)������ǹ��
	gl	(Grenade Launcher)�����ף�
	rl	(Rocket Launcher)������ڣ�
	lg	(Lightning Gun)����ǹ��
	rg	(Railgun)������ǹ��
	pg	(Plasma Gun)��������ǹ��
	bullets	(qty: 50)����ǹ�ӵ�������50��
	shells	(qty: 10)������ǹ�ӵ�������10��
	grenades	(qty: 5)�����ף�����5��
	rockets	(qty: 5)�������������5��
	lightning	(qty: 50)����ǹ�ӵ�������50��
	slugs		(qty: 10)������ǹ�ӵ�������10��
	cells		(qty: 50)��BFG�ӵ�������50

��ҿ����������������ӳ����ӣ�
	\drop flag


����/ͼ������
--------------------------
�����q3config.cfg��autoexec.cfg�����ڿͻ���Ҫ���е����������ļ���
��com_hunkmegs����Ϊ56��64���Ȳ�������.cfg�е����ã�����Ҳ����������
���м��룺+set com_hunkmegs 56��


ʹ��ViewCam
------------------
�����м��ֲ�ͬ�ķ�����ʹ��viewcam���ֱ�Ϊ��
	- �ڿ���̨����: \viewcam
	- ����: \team vc
	- ���Թ�ģʽ��ѭ���鿴���ĸ���λ��

�����ʽ�еĹ۲�㶼�ǵ�ͼ�о�������ս���ĵط�����Ҫ�ֹ���һ����ͬ
��viewcamλ�ã����룺

	\vc_free

	----> ������������л��ֹ������Զ���viewcam��λ

������������ʽ�¸���һ����ң�
	\vc_follow

Ҫ����һ��ָ������ң����룺
	\vc_follow [PLAYER_ID|PLAYER_NAME]

	----> ע�������ʹ����Ծ/�¶׼����л��������

viewcamλ���Ǵ����Ϊÿ����ͼ�ƶ����ر������ļ��еģ����һ����ͼ
û��viewcamλ�ö����ļ����������ͼ��viewcam���ܽ����رա�

����һ���µ�viewcam�����ļ��Ǽ������׺���Ȥ�Ĺ����������й�����
����Docs/Viewcam-info.txt�С�

������Լ�����һ��OSPû�а�����viewcam�����ļ�������������ң���
���������һ���汾�С���Ȼ�������Ҳ���������������г��֡�

==========
  ����
==========
��лa|citizen �� a|wiseguy���Լ�������abuse���飩�������ҵĹ�����
�������http://www.teamabuse.com/���ҵ����ǵ���Ϣ��

��лKhaile��Hoony��CPMȫ����Ա���������ṩ��CPM����Ͱ�������OSP��
�����˶�CPM��֧�֣��������http://www.change-world.com/promode��
�õ����ǵ������Ϣ��

��л��Щviewcam��λ���ļ��ƶ��ߣ�
      [AVL]Gouki  - q3ctf3, q3ctf4, q3wctf1-3, japanctf
      jab         - q3ctf1, q3ctf2
      Olzah       - ztn3dm1
      Rune        - q3tourney2
      SoloRail    - q3dm1-4, q3dm8-12
      TrEEcH      - q3dm13, q3dm17, q3jdm8a
      VK-Hunter   - q3dm14-16,19 q3tourney1,3,5, overkill

��л��Щ������OSP���ˣ�Godsmurf, Talita, FiTH-arcane,
TrEEcH, Gouki, Olzah, and Smegma (ewww)����Ǹ������Ϊ�˹���
�һ�������©�˼�λ��

��лtubesock/Gouki..�������ԣ�����������OSP����л���ǵİ�����

��л]R[Papa (http://www.reactivesoftware.com)��Strider��Э�����
id���¼�/�������⡣

��лCPMA��arQon����Щʱ�����OSP 0.99xϵ�кܶ����Ƭ�εİ�����

��лStrider (Alan Kivlin - akivlin@lineone.net)�Ŀͻ���125HZȡ������
�Ͷ��ӽ��Թ۵�һЩ��������һ�ֿ�Ķ����ӽ��һ�û�м��룩

��лJim Luther (dv8|Fia) �� [AVL]Hifi�������Ҽ�⵽OSP��ƻ�����ϵ����⡣


��лHeelerΪOSP����TGA��ͼƬ

��лevolution����(http://evolution.clanpages.com)ΪOSP�Թ����õ�
���ӽ��Թ�ѡ����ѡ��һЩ�µ����ԡ�

���⣬ע�⣬ȱ�ݣ�����Ҫ���뽫���з�����

      rhea@OrangeSmoothie.org

�����ͨ�����ǵ���ҳ�����OSP���µ�������Ϣ

      http://www.OrangeSmoothie.org/beta.html

��Ҳ���������ǵ���̳���н���
      http://www.OrangeSmoothie.org/forum/

����Ҳ���Լ���IRCƵ����#osp,��EnterTheGame
(irc.enterthegame.com:6667)����http://www.enterthegame.com
���Ի��IRC������������������á�

��л��ʹ��OSP
-Rhea