-------------------------------
---  "Gruff" Awesome theme  ---
------- Basé sur fiesta -------
-------------------------------

-- {{{ Principal
theme = {}
theme.wallpaper_cmd = { "feh --bg-scale ".. os.getenv("HOME") .."/.config/awesome/current_wallpaper" }

--ne changer pas le wallpaper ici sinon le menu qui gere les wallpapers ne fonctionnera plus

theme.path = home .."/.config/awesome/themes/gruff"
-- }}}


-- {{{ Police
theme.font      = "Droid Sans 8"
-- }}}

-- {{{ Couleurs
theme.fg_normal = "#6CA164"
theme.fg_focus  = "#000000"
theme.fg_urgent = "#000000"
theme.bg_normal = "#3C3C3C"
theme.bg_focus  = "#6CA164"
theme.bg_urgent = "#FF8C36"
-- }}}

-- {{{ Font colors for naughty popups
-- colors
green="#7fb219"
cyan="#7f4de6"
red="#e04613"                             
lblue="#6c9eab"                        
dblue="#00ccff"
black="#000000"
lgrey="#d2d2d2"
dgrey="#333333"
white="#ffffff"

alpha="dd"

theme.notify_font= "DroidSansMono 7"
theme.notify_font_color_1 = white
theme.notify_font_color_2 = lgrey
theme.notify_font_color_3 = red
theme.notify_font_color_4 = white
theme.notify_fg = theme.fg_normal
theme.notify_bg = theme.bg_normal
theme.notify_border = theme.border_focus
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
theme.tooltip_font= "DroidSansMono 7"
-- }}}

-- {{{ Bordures
theme.border_width  = 1
theme.border_normal = "#3C3C3C"
theme.border_focus  = "#6CA164"
-- }}}

--{{{ Transparence
theme.opacity_focus = 0.85
theme.opacity_normal = 0.75 
-- }}}

-- {{{ Widgets
theme.fg_widget = "#000000"
theme.bg_widget = "#FF8C36"
theme.wibox_height = 14
-- }}}

-- {{{ Menu
theme.menu_height = 15
theme.menu_width  = 170
theme.menu_border_width = 0
theme.menu_border_color = "#000000"

-- }}}

-- {{{ Titlebar
theme.titlebar_bg_focus  = "#3C3C3C"
theme.titlebar_bg_normal = "#3C3C3C"
theme.titlebar_height = 10
-- }}}

-- {{{ Icones
--menu icons
theme.awesome_icon           = theme.path.."/awesome-icon.png"
theme.menu_submenu_icon      = theme.path.."/submenu.png"

--tasklist icons
theme.tasklist_floating_icon = theme.path.."/tasklist/floating.png"

--taglist icons
theme.taglist_squares_sel    = theme.path.."/taglist/squarefz.png"
theme.taglist_squares_unsel  = theme.path.."/taglist/squarez.png"

--layout icons
theme.layout_tile       = theme.path.."/layouts/tile.png"
theme.layout_tileleft   = theme.path.."/layouts/tileleft.png"
theme.layout_tilebottom = theme.path.."/layouts/tilebottom.png"
theme.layout_tiletop    = theme.path.."/layouts/tiletop.png"
theme.layout_fairv      = theme.path.."/layouts/fairv.png"
theme.layout_fairh      = theme.path.."/layouts/fairh.png"
theme.layout_spiral     = theme.path.."/layouts/spiral.png"
theme.layout_dwindle    = theme.path.."/layouts/dwindle.png"
theme.layout_max        = theme.path.."/layouts/max.png"
theme.layout_fullscreen = theme.path.."/layouts/fullscreen.png"
theme.layout_magnifier  = theme.path.."/layouts/magnifier.png"
theme.layout_floating   = theme.path.."/layouts/floating.png"

--widget icons
--theme.widget_cpu        = "/usr/share/icons/".. icon_theme .."/24x24/Zimages/chip.png"
--theme.widget_fs         = "/usr/share/icons/".. icon_theme .."/miscellaneous/128x128/filesystems/gnome-fs-blockdev"
--theme.widget_date		= "/usr/share/icons/".. icon_theme .."/miscellaneous/128x128/apps/clock.png"
--theme.widget_music		= "/usr/share/icons/".. icon_theme .."/miscellaneous/128x128/apps/xmms.png"
--theme.widget_mem		= "/usr/share/icons/".. icon_theme .."/24x24/Zimages/chip.png"
--theme.widget_netup      = "/usr/share/icons/".. icon_theme .."/24x24/Zimages/up.png"
--theme.widget_net        = "/usr/share/icons/".. icon_theme .."/24x24/Zimages/down.png"
--theme.widget_cal        = "/usr/share/icons/".. icon_theme .."/48x48/Zimages/calendar-clock.png"
--theme.widget_power      = "/usr/share/icons/".. icon_theme .."/24x24/Zimages/media-shutdown.png"

--theme.task 				= theme.path.."/icons2/task.png"
--theme.tasks 			= theme.path.."/icons2/tasks.png"
--theme.task_done 		= theme.path.."/icons2/task_done.png"
--theme.project 			= theme.path.."/icons2/project.png"

theme.accept 			= "/usr/share/icons/".. icon_theme .."/128x128/Zimages/check.png"
theme.cancel 			= "/usr/share/icons/".. icon_theme .."/128x128/Zimages/stop.png"
theme.usb 				= "/usr/share/icons/".. icon_theme .."/128x128/Zimages/usb-stick.png"
theme.cdrom 			= "/usr/share/icons/".. icon_theme .."/128x128/Zimages/cd.png"

-- batterie
--theme.widget_bat100	  = "/usr/share/icons/".. icon_theme .."/gnome-power-manager/128x128/status/gpm-battery-100.png"
--theme.widget_bat80      = "/usr/share/icons/".. icon_theme .."/gnome-power-manager/128x128/status/gpm-battery-080.png"
--theme.widget_bat66      = "/usr/share/icons/".. icon_theme .."/gnome-power-manager/128x128/status/gpm-battery-060.png"
--theme.widget_bat33      = "/usr/share/icons/".. icon_theme .."/gnome-power-manager/128x128/status/gpm-battery-040.png"
--theme.widget_bat10      = "/usr/share/icons/".. icon_theme .."/gnome-power-manager/128x128/status/gpm-battery-020.png"
--theme.widget_bat0       = "/usr/share/icons/".. icon_theme .."/gnome-power-manager/128x128/status/gpm-battery-000.png"
--theme.widget_bat100c	  = "/usr/share/icons/".. icon_theme .."/gnome-power-manager/128x128/status/gpm-battery-100-charging.png"
--theme.widget_bat80c     = "/usr/share/icons/".. icon_theme .."/gnome-power-manager/128x128/status/gpm-battery-080-charging.png"
--theme.widget_bat66c     = "/usr/share/icons/".. icon_theme .."/gnome-power-manager/128x128/status/gpm-battery-060-charging.png"
--theme.widget_bat33c     = "/usr/share/icons/".. icon_theme .."/gnome-power-manager/128x128/status/gpm-battery-040-charging.png"
--theme.widget_bat10c     = "/usr/share/icons/".. icon_theme .."/gnome-power-manager/128x128/status/gpm-battery-020-charging.png"
--theme.widget_bat0c      = "/usr/share/icons/".. icon_theme .."/gnome-power-manager/128x128/status/gpm-battery-000-charging.png"
--theme.widget_baterror   = "/usr/share/icons/".. icon_theme .."/gnome-power-manager/128x128/status/gpm-battery-missing.png"

-- volume
--theme.widget_vol100     = "/usr/share/icons/".. icon_theme .."/gnome/16x16/status/audio-volume-high.png"
--theme.widget_vol50      = "/usr/share/icons/".. icon_theme .."/gnome/16x16/status/audio-volume-medium.png"
--theme.widget_vol33	  = "/usr/share/icons/".. icon_theme .."/gnome/16x16/status/audio-volume-low.png"
--theme.widget_volmute    = "/usr/share/icons/".. icon_theme .."/gnome/16x16/status/audio-volume-muted.png"

--==applications icons==
-- set icons buuf
theme.terminal_icon		= "/usr/share/icons/".. icon_theme .."/128x128/Zimages/window-shell.png"
theme.execute_icon		= "/usr/share/icons/".. icon_theme .."/128x128/Zimages/wheel.png"
theme.browser_icon		= "/usr/share/icons/".. icon_theme .."/miscellaneous/128x128/apps/midori.png"
theme.filer_icon		= "/usr/share/icons/".. icon_theme .."/miscellaneous/128x128/apps/nautilus.png"
theme.editor_icon		= "/usr/share/icons/".. icon_theme .."/miscellaneous/128x128/apps/gvim.png"
theme.mediaplayer_icon	= "/usr/share/icons/".. icon_theme .."/miscellaneous/128x128/apps/gnome-media-player.png"
theme.shutdown_icon 	= "/usr/share/icons/".. icon_theme .."/24x24/Zimages/media-shutdown.png"
theme.lock_icon			= "/usr/share/icons/".. icon_theme .."/128x128/Zimages/lock.png"

--set icons awoken
--theme.terminal_icon		= "/usr/share/icons/".. icon_theme .."/clear/128x128/apps/Terminal.png"
--theme.execute_icon		= "/usr/share/icons/".. icon_theme .."/clear/128x128/actions/gnome-run.png"
--theme.browser_icon		= "/usr/share/icons/".. icon_theme .."/clear/128x128/apps/firefox-default.png"
--theme.filer_icon		= "/usr/share/icons/".. icon_theme .."/clear/128x128/apps/file-manager.png"
--theme.editor_icon		= "/usr/share/icons/".. icon_theme .."/clear/128x128/apps/geany.png"
--theme.mediaplayer_icon	= "/usr/share/icons/".. icon_theme .."/clear/128x128/apps/gnome-mplayer.png"
--theme.shutdown_icon 	= "/usr/share/icons/".. icon_theme .."/clear/128x128/actions/system-shutdown-panel.png"
--theme.lock_icon			= "/usr/share/icons/".. icon_theme .."/clear/128x128/actions/lock.png"

--==titlebar icons==
-- set icons buuf
theme.titlebar_close_button_normal = "/usr/share/icons/".. icon_theme .."/gnome/24x24/actions/gtk-close.png"
theme.titlebar_close_button_focus = "/usr/share/icons/".. icon_theme .."/gnome/24x24/actions/gtk-close.png"

theme.titlebar_sticky_button_normal_inactive = "/usr/share/icons/".. icon_theme .."/24x24/Zimages/lock-open.png"
theme.titlebar_sticky_button_focus_inactive = "/usr/share/icons/".. icon_theme .."/24x24/Zimages/lock-open.png"
theme.titlebar_sticky_button_normal_active = "/usr/share/icons/".. icon_theme .."/24x24/Zimages/lock.png"
theme.titlebar_sticky_button_focus_active = "/usr/share/icons/".. icon_theme .."/24x24/Zimages/lock.png"

theme.titlebar_floating_button_normal_active = "/usr/share/icons/".. icon_theme .."/24x24/Zimages/screen-up.png"
theme.titlebar_floating_button_focus_active = "/usr/share/icons/".. icon_theme .."/24x24/Zimages/screen-up.png"
theme.titlebar_floating_button_normal_inactive = "/usr/share/icons/".. icon_theme .."/24x24/Zimages/screen-up.png"
theme.titlebar_floating_button_focus_inactive = "/usr/share/icons/".. icon_theme .."/24x24/Zimages/screen-up.png"

theme.titlebar_maximized_button_normal_inactive = "/usr/share/icons/".. icon_theme .."/gnome/24x24/actions/gtk-fullscreen.png"
theme.titlebar_maximized_button_focus_inactive = "/usr/share/icons/".. icon_theme .."/gnome/24x24/actions/gtk-fullscreen.png"
theme.titlebar_maximized_button_normal_active = "/usr/share/icons/".. icon_theme .."/gnome/24x24/actions/gtk-leave-fullscreen.png"
theme.titlebar_maximized_button_focus_active = "/usr/share/icons/".. icon_theme .."/gnome/24x24/actions/gtk-leave-fullscreen.png"

--set icons awoken
--theme.titlebar_close_button_normal = "/usr/share/icons/".. icon_theme .."/clear/128x128/actions/gtk-close.png"
--theme.titlebar_close_button_focus = "/usr/share/icons/".. icon_theme .."/clear/128x128/actions/gtk-close.png"

--theme.titlebar_sticky_button_normal_inactive = "/usr/share/icons/".. icon_theme .."/clear/24x24/actions/lock.png"
--theme.titlebar_sticky_button_focus_inactive = "/usr/share/icons/".. icon_theme .."/clear/24x24/actions/lock.png"
--theme.titlebar_sticky_button_normal_active = "/usr/share/icons/".. icon_theme .."/clear/24x24/actions/lock.png"
--theme.titlebar_sticky_button_focus_active = "/usr/share/icons/".. icon_theme .."/clear/24x24/actions/lock.png"
-- }}}



return theme
