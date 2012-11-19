-- submenu  -----------------------------------------------------------------------
capture = {
{"Maintenant", "scrot '%Y-%m-%d--%s_$wx$h_scrot.png' -e 'mv $f ".. screenshots .." & gpicview ".. screenshots .."$f'"},
{"Dans 5s", "scrot -d5 '%Y-%m-%d--%s_$wx$h_scrot.png' -e 'mv $f ".. screenshots .." & gpicview ".. screenshots .."$f'"},
{"Dans 10s", "scrot -d10 '%Y-%m-%d--%s_$wx$h_scrot.png' -e 'mv $f ".. screenshots .." & gpicview ".. screenshots .."$f'"},
{"Selection", "scrot -s '%Y-%m-%d--%s_$wx$h_scrot.png' -e 'mv $f ".. screenshots .." & gpicview ".. screenshots .."$f'"}
 }
 
firewall = {
{"Editer les règles", terminal .." -e sudo ".. editor .."/usr/local/bin/update-iptables.sh"},
{"Appliquer", "gksudo /usr/local/bin/update-iptables.sh"},
 }

vpn = {
{"VPN - Arethusa", "gksudo ".. home .."/.bin/vpn.sh"},
{"Deconnexion VPN", "gksudo killall openvpn"},
 }

awesomemenu = {
{"Relancer", awesome.restart},
{"Deconnexion", awesome.quit },
{ "--------" },
{"Page de manuel", terminal .." -e man awesome"},
{ "--------" },
{"Editer autorun.lua", editor_cmd .." ".. config_dir .."/config/autorun.lua"},
{"Editer keys.lua", editor_cmd .." ".. config_dir .."/config/keys.lua"},
{"Editer menu.lua", editor_cmd .." ".. config_dir .."/config/menu.lua"},
{"Editer mouse.lua", editor_cmd .." ".. config_dir .."/config/mouse.lua"},
{"Editer rules.lua", editor_cmd .." ".. config_dir .."/config/rules.lua"},
{"Editer signals.lua", editor_cmd .." ".. config_dir .."/config/signals.lua"},
{"Editer tags.lua", editor_cmd .." ".. config_dir .."/config/tags.lua"},
{"Editer menu.lua", editor_cmd .." ".. config_dir .."/config/menu.lua"},
{"Editer widgets.lua", editor_cmd .." ".. config_dir .."/config/widgets.lua"},
 }

----

-- main Menu -----------------------------------------------------------------------

prefs = {
{"Config Awesome", awesomemenu},
{ "--------" },
{"Config Firewall", firewall},
{ "--------" },
{"Themes", mythememenu },
{"Wallpapers", mywallmenu },
{"Random Wallpaper", home .. "/.bin/random_wall.sh -s" },
{"Apparence", apparence},
{"Parametres d'affichage", "grandr"},
 }
 
accessoires = {
   { "Gestionnaire d'archive", archiver },
   { "Editeur de texte", guieditor },
   { "Terminal", terminal },
   { "Gestion de fichiers", filer },
   { "Gestion de fichiers (root)", "gksudo ".. filer },
}

jeux = {
    { "W:ET - LSD", home .. "/.bin/et-lsd" },
    { "SimFWO", "wine " .. home .. "/downloads/SimFantasy/SimFantasy.exe" },
    { "PlayOnLinux", "playonlinux" },
}

multimedia = {
   { "Lecteur Multimedia", mediaplayer },
   { "Lecteur Musique", musicplayer },
   { "Audio CD Ripper", "rrip_gui" },
   { "Handbrake DVDRip", "handbrake-gtk"},
   { "Graveur de cd/dvd", burner },
}

internet = {
   { "VPN", vpn },
   { "Navigateur luakit", webcli },
   { "Navigateur firefox", webgui },
   { "Client irc", irc },
   { "Client FTP", ftpgui },
   { "Transmission (torrent)", torrent },
}

bureautique = {
   { "Traitement de texte", writer },
   { "Tableur", tableur },
   { "Calculatrice", calc },
   { "Visionneur PDF", pdf },
}

graphismmenu = { 
{"The Gimp", "gimp"},
{"Inkscape", "inkscape"},
{"Freecad", "freecad"},
{"Visionneur d'images", imageviewer},
{"Capture d'ecran", capture},
}

-- Main Menu -----------------------------------------
mymainmenu = awful.menu({ items = { 
					{ "Executer", 
						"dmenu_run -i -p 'Executer :' -nb '" .. beautiful.bg_normal .. 
						"' -nf '" .. beautiful.fg_normal .. 
						"' -sb '" .. beautiful.bg_focus .. 
						"' -sf '" .. beautiful.fg_focus .. "'",
						beautiful.execute_icon
				    },
				    { "--------" },
				    { "Terminal", terminal, beautiful.terminal_icon },
				    { "Navigateur Internet", webcli, beautiful.browser_icon },
				    { "Navigateurs de fichiers", filer, beautiful.filer_icon },
                    { "Editeur de Texte", guieditor, beautiful.editor_icon },
                    { "Lecteur Multimedia", mediaplayer, beautiful.mediaplayer_icon },
                    { "Virtualbox", "virtualbox"},
                    { "--------" },
                    { "Accessoires", accessoires },
                    { "Graphisme", graphismmenu },
                    { "Multimedia", multimedia },
                    { "Jeux", jeux },
                    { "Internet", internet },
                    { "Bureautique", bureautique },
                    { "--------" },
				    { "Preferences", prefs },
                    { "--------" },
                    { "Verrouiller l'ecran", locker, beautiful.lock_icon },
                    { "Quitter", "shutdown.sh", beautiful.shutdown_icon }
               }
})
------------------------------------------------------
 
-- Launcher Menu --------------------------------------------------------------------------------
if menu_icon then
	mylauncher = awful.widget.launcher({ image = image(beautiful.awesome_icon), menu = mymainmenu })
end
------------------------------------------------------------------------------------------------
