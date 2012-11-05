-- Widgets Library -------
require("vicious")
require("couth.couth")

local menu = require('menu')

-- Sound Control
require('couth.alsa')
couth.CONFIG.ALSA_CONTROLS = {
     'Master',
     'PCM',
}
couth.CONFIG.NOTIFIER_FONT = "DroidSansMono 7"

-- Create a systray
mysystray = widget({ type = "systray" })

-- Create Wibox ------------------------------------------------------------------------------
mywibox = {}
my_bottom_wibox ={}
mypromptbox = {}
mylayoutbox = {}
mytaglist = {}
mytaglist.buttons = awful.util.table.join(
                    awful.button({ }, 1, awful.tag.viewonly),
                    awful.button( k_m , 1, awful.client.movetotag),
                    awful.button({ }, 3, awful.tag.viewtoggle),
                    awful.button( k_m, 3, function(t) menu.create.tags(nil, t) end),
                    awful.button({ }, 8, awful.client.toggletag),
                    awful.button({ }, 4, awful.tag.viewnext),
                    awful.button({ }, 5, awful.tag.viewprev)
                    )
                
mytasklist = {}
mytasklist.buttons = awful.util.table.join(
                     awful.button({ }, 1,
						function (c)
							if not c:isvisible() then awful.tag.viewonly(c:tags()[1]) end
							if client.focus == c then
								c.minimized = not c.minimized
							else
								client.focus = c
								c:raise()
							end
						end
					),
					awful.button({ }, 2, function (c) c:kill() end),
					awful.button({ }, 3,
						function (c)
							if instance then
								instance:hide()
								instance = nil
							else
								instance = menu.create.clients(nil, c)
							end
						end
					),
					awful.button({ }, 4,
						function ()
							awful.client.focus.byidx(1)
								if client.focus then client.focus:raise() end
						end
					),
					awful.button({ }, 5,
						function ()
							awful.client.focus.byidx(-1)
							if client.focus then client.focus:raise() end
						end
					)
				)
for s = 1, screen.count() do
-----------------------------------------------------------------------------------------------
os.setlocale("fr_FR.UTF-8")

-- Create a textclock widget
datewidget = widget({ type = "textbox" })
vicious.register(datewidget, vicious.widgets.date, "<span color=\""..beautiful.fg_normal.."\" size=\"small\">%a %d %b %Y %R</span>", 60)

------------------------------------------------------------------

-- Promptbox ------------------------------------------------------------------------------
mypromptbox[s] = awful.widget.prompt({ layout = awful.widget.layout.horizontal.leftright })
-------------------------------------------------------------------------------------------

-- Layout Box ----------------------------------------------------------------------------------
mylayoutbox[s] = awful.widget.layoutbox(s)
mylayoutbox[s]:buttons(awful.util.table.join(
                           awful.button({ }, 1, function () awful.layout.inc(layouts, 1) end),
                           awful.button({ }, 3, function () awful.layout.inc(layouts, -1) end),
                           awful.button({ }, 4, function () awful.layout.inc(layouts, 1) end),
                           awful.button({ }, 5, function () awful.layout.inc(layouts, -1) end)))
------------------------------------------------------------------------------------------------

-- Taglist ------------------------------------------------------------------------------
mytaglist[s] = awful.widget.taglist(s, awful.widget.taglist.label.all, mytaglist.buttons)
-----------------------------------------------------------------------------------------

-- Tasklist ----------------------------------------------------------------------------------
mytasklist[s] = awful.widget.tasklist(function(c)
				  return awful.widget.tasklist.label.currenttags(c, s)
			  end, mytasklist.buttons)
----------------------------------------------------------------------------------------------

-- Separator left  ------------------------
separatorl = widget({ type = "textbox" })
separatorl.text = ' [ '
-------------------------------------------

-- Separator right ------------------------
separatorr = widget({ type = "textbox" })
separatorr.text = ' ] '
-------------------------------------------

-- Separator ------------------------------
separator = widget({ type = "textbox" })
separator.text = ' | '
-------------------------------------------

-- Spacer ---------------------------------------------------------------
spacer         		= widget({ type = "textbox", name = "myspacer" })
spacer.text    		= " "
-------------------------------------------------------------------------

-- Systray -----------------------------
mysystray = widget({ type = "systray" })
----------------------------------------

-- ==SYSTEM==
uptime = widget({ type = "textbox" })
uptime_t = awful.tooltip({ objects = { uptime },})
vicious.register(uptime, vicious.widgets.uptime,
	function (widget, args)
		uptime_t:set_text("Load : [".. args[4] .."/".. args[5] .."/".. args[6] .."]\n")
		return "<span color=\""..beautiful.fg_normal.."\" size=\"small\">Uptime : " .. args[1] .. "d " .. args[2] .. "h " .. args[3] .. "m </span>"
	end,60)


-- CPU widget
require ("popups")

cpuwidget = widget({ type = "textbox" })

vicious.register(cpuwidget, vicious.widgets.cpu,
	function (widget, args)
		if args[1] >= 50 and args[1] <= 75 then
			return "<span color=\""..beautiful.bg_urgent.."\" size=\"small\">Cpu : " .. args[1] .. "%</span>"
		elseif args[1] > 75 then
			return "<span color=\"red\" size=\"small\">Cpu : " .. args[1] .. "%</span>"
		else
			return "<span color=\""..beautiful.fg_normal.."\" size=\"small\">Cpu : " .. args[1] .. "%</span>"
		end
	end )
cpuwidget:buttons(awful.util.table.join(awful.button({}, 1, function () awful.util.spawn ( terminal .. " -e htop --sort-key PERCENT_CPU") end ) ) )
popups.htop(cpuwidget,{ title_color = beautiful.notify_font_color_1, user_color= beautiful.notify_font_color_2, root_color=beautiful.notify_font_color_3, terminal = "urxvtc"})


-- Ram widget
memwidget = widget({ type = "textbox" })
memwidget_t = awful.tooltip({ objects = { memwidget },})

vicious.cache(vicious.widgets.mem)
vicious.register(memwidget, vicious.widgets.mem, 
	function (widget, args)
		memwidget_t:set_text("Utilisé : " .. args[2] .. "/" .. args[3] .. "\nLibre : " .. args[4] .. "\n\nSwap : " .. args[5] .."/" .. args[7])
		return "<span color=\""..beautiful.fg_normal.."\" size=\"small\">Mem : " .. args[1] .. "%</span>"
	end, 59)

-- Filesystem widgets
-- root
fsrwidget = widget({ type = "textbox" })

vicious.register(fsrwidget, vicious.widgets.fs,
function (widget, args)
	if args["{/ used_p}"] >= 93 and args["{/ used_p}"] < 97 then
		return "<span color=\""..beautiful.bg_focus.."\" size=\"small\">root " .. args["{/ used_p}"] .. "% used (" .. args["{/ avail_gb}"] .. " GiB free) </span>"
	elseif args["{/ used_p}"] >= 97 and args["{/ used_p}"] < 99 then
		return "<span color=\"purple\" size=\"small\">root " .. args["{/ used_p}"] .. "% used (" .. args["{/ avail_gb}"] .. " GiB free)</span>"
	elseif args["{/ used_p}"] >= 99 and args["{/ used_p}"] <= 100 then
		naughty.notify({ 
			title = "Avertissement Disque dur", 
			text = "Plus d'espace libre sur root!\nFaite de la place.", 
			timeout = 10, position = "top_right", 
			fg = beautiful.fg_urgent, 
			bg = beautiful.bg_urgent 
		})
		return "<span color=\"red\" size=\"small\">root " .. args["{/ used_p}"] .. "% used (" .. args["{/ avail_gb}"] .. " GiB free)</span>"
	else
		return "<span color=\""..beautiful.fg_normal.."\" size=\"small\">root " .. args["{/ used_p}"] .. "% used (" .. args["{/ avail_gb}"] .. " GiB free)</span>"
	end
end, 621)

popups.disk(fsrwidget,{ title_color = beautiful.notify_font_color_1})			

-----Udisks menu---------------------------------
--require ("lib.udisks_glue")
--udisks_glue=udisks_glue.new(beautiful.usb)
-- udisks_glue:set_mount_icon(beautiful.accept)
-- udisks_glue:set_umount_icon(beautiful.cancel)
-- udisks_glue:set_detach_icon(beautiful.cancel)
-- udisks_glue:set_Usb_icon(beautiful.usb)
-- udisks_glue:set_Cdrom_icon(beautiful.cdrom)

-- Battery state -----------------------
-- Initialize widget 
batwidget = widget({ type = "textbox" })
bat_t = awful.tooltip({ objects = { batwidget },})

-- Register widget
vicious.register(batwidget, vicious.widgets.bat,
function (widget, args)
	if args[2] == 0 then return ""
	else
		bat_t:set_text("Niveau: " .. args[2] .. "% restant !\nEtat: " .. args[1] .. "\nTemps restant: " .. args[3] .."")
		if args[2] < 15 then
			naughty.notify({ 
				title = "Avertissement Batterie", 
				text = "Batterie faible ! "..args[2].."% restant!\nBranchez vous sur le secteur.", 
				timeout = 10, 
				position = "top_right", 
				fg = beautiful.fg_urgent, 
				bg = beautiful.bg_urgent 
			})
			return "<span color=\""..beautiful.bg_urgent.."\" size=\"small\">Bat : ".. args[2] .. "%</span>"
		else
			return "<span color=\""..beautiful.fg_normal.."\" size=\"small\">Bat : ".. args[2] .. "%</span>"
		end
	end
end, 61, Battery
)
batwidget:buttons(awful.util.table.join(awful.button({}, 1, function () awful.util.spawn ("xfce4-power-manager-settings") end ) ) )

-----------------------------------------

volwidget = widget({ type = "textbox" })
vicious.register(volwidget, vicious.widgets.volume,
function (widget, args)
	if args[1] == 0 or args[2] == "♩" then
		return "<span color=\""..beautiful.bg_urgent.."\" size=\"small\">Vol : mute</span>"
	else
		return "<span color=\""..beautiful.fg_normal.."\" size=\"small\">Vol : " .. args[1] .. "</span>"
	end
end, 2, "Master" )

volwidget:buttons(awful.util.table.join(
	awful.button({ }, 1, function () exec(couth.notifier:notify( couth.alsa:setVolume('Master','toggle'))) end),
	awful.button({ }, 4, function () exec(couth.notifier:notify( couth.alsa:setVolume('Master','3dB+'))) end),
	awful.button({ }, 5, function () exec(couth.notifier:notify( couth.alsa:setVolume('Master','3dB-'))) end),
	awful.button({ "Control" }, 1, function () exec(couth.notifier:notify( couth.alsa:setVolume('PCM','toggle'))) end),
	awful.button({ "Control" }, 4, function () exec(couth.notifier:notify( couth.alsa:setVolume('PCM','3dB+'))) end),
	awful.button({ "Control" }, 5, function () exec(couth.notifier:notify( couth.alsa:setVolume('PCM','3dB-'))) end),    
	awful.button({ }, 3, function () exec(teardrop("urxvtc -T alsamixer -e alsamixer","center","center",800,600)) end)    
))
volwidget:add_signal('mouse::enter', function () couth.notifier:notify( couth.alsa:getVolume() ) end)
volwidget:add_signal('mouse::leave', function () naughty.destroy(volinfo[1]) end)

-- ==========

-- ==NETWORK==
-- net widget --------------------------
net = widget({ type = "textbox" })

vicious.register(net, vicious.widgets.net, 
				function (widget, args)
					local out = "Net :"
					for line in io.lines("/proc/net/dev") do
						local name = string.match(line, "^[%s]?[%s]?[%s]?[%s]?([%w]+):")
						local received = tonumber(string.match(line, ":[%s]*([%d]+)"))
						if name ~= nil then
							if name ~= "lo" then
								if received ~= 0 then
									out = out .. " <span color=\""..beautiful.fg_normal.."\" size=\"small\">" .. name .."</span> <span color=\"red\" size=\"x-small\">up </span><span color=\"red\" size=\"small\">" .. args["{" .. name .." up_kb}"] .. "KB</span> / <span color=\"green\" size=\"small\">" .. args["{" .. name .." down_kb}"] .. "KB</span><span color=\"green\" size=\"x-small\"> dn</span>" 
								end
							end
						end
					end
					return out
                end, 1)

popups.netstat(net,{ title_color = beautiful.notify_font_color_1, established_color= beautiful.notify_font_color_2, listen_color=beautiful.notify_font_color_3})			
----------------------------------------

-- Mail widget -------------------------
-- put your gmail credentials in ~/.netrc file
-- syntax :
-- #machine mail.google.com login <e-mail address> password <password>

mygmail = widget({ type = "textbox" })
gmail_t = awful.tooltip({ objects = { mygmail },})

vicious.register(mygmail, vicious.widgets.gmail,
                function (widget, args)
                    gmail_t:set_text(args["{subject}"])
                    return "<span color=\""..beautiful.fg_normal.."\" size=\"small\">Mail : " .. args["{count}"] .. "</span>"
                 end, 120) 
                 --the '120' here means check every 2 minutes.
mygmail:buttons(awful.util.table.join(awful.button({}, 1, function () awful.util.spawn ( webcli .. " https://mail.google.com") end ) ) )
----------------------------------------


-- Apt Widget --------------------------
aptwidget = widget({type = "textbox"})
aptwidget_t = awful.tooltip({ objects = { aptwidget},})

vicious.register(aptwidget, vicious.widgets.pkg,
                function(widget,args)
                    local io = { popen = io.popen }
                    local s = io.popen("apt-show-versions -u -b")
                    local str = ''

                    for line in s:lines() do
                        str = str .. line .. "\n"
                    end
                    aptwidget_t:set_text(str)
                    s:close()
                    return "<span color=\""..beautiful.fg_normal.."\" size=\"small\">Upd : " .. args[1] .. "</span>"
                end, 1800, "Debian")

                --'1800' means check every 30 minutes
aptwidget:buttons(awful.util.table.join(awful.button({}, 1, function () teardrop("urxvtc -e update.sh", "bottom","center",800,100,true) end ) ) )
-----------------------------------------

-- Enable mocp
function moc_control (action)
	local moc_info,moc_state
 
	if action == "next" then
		io.popen("mocp --next")
	elseif action == "previous" then
		io.popen("mocp --previous")
	elseif action == "stop" then
		io.popen("mocp --stop")
	elseif action == "play_pause" then
		moc_info = io.popen("mocp -i"):read("*all")
	        moc_state = string.gsub(string.match(moc_info, "State: %a*"),"State: ","")
 
		if moc_state == "PLAY" then
			io.popen("mocp --pause")
		elseif moc_state == "PAUSE" then
			io.popen("mocp --unpause")
		elseif moc_state == "STOP" then
			io.popen("mocp --play")
		end
	end
end

tb_moc = widget({ type = "textbox", align = "right" })

function hook_moc()
      fpid = io.popen("pgrep -o mocp")
      pid = fpid:read("*n")
	  fpid:close()
	  
      if pid then
	   moc_info = io.popen("mocp -i"):read("*all")
       moc_state = string.gsub(string.match(moc_info, "State: %a*"),"State: ","")
       if moc_state == "PLAY" or moc_state == "PAUSE" then
           moc_artist = string.gsub(string.match(moc_info, "Artist: %C*"), "Artist: ","")
           moc_title = string.gsub(string.match(moc_info, "SongTitle: %C*"), "SongTitle: ","")
           moc_curtime = string.gsub(string.match(moc_info, "CurrentTime: %d*:%d*"), "CurrentTime: ","")
           moc_totaltime = string.gsub(string.match(moc_info, "TotalTime: %d*:%d*"), "TotalTime: ","")
           if moc_artist == "" then 
               moc_artist = "artiste inconnu" 
           end
           if moc_title == "" then 
               moc_title = "titre inconnu" 
           end
	   -- moc_title = string.format("%.5c", moc_title)
           moc_string = moc_artist .. " - " .. moc_title .. "(" .. moc_curtime .. "/" .. moc_totaltime .. ")"
           if moc_state == "PAUSE" then 
               moc_string = "PAUSE - " .. moc_string .. ""
           end
       else
           moc_string = "-- Lecture stoppée --"
       end
	  else
      	   moc_string = ""
      end
      return moc_string
end
 
-- refresh Moc widget
moc_timer = timer({timeout = 1})
moc_timer:add_signal("timeout", function() tb_moc.text = ' ' .. hook_moc() .. ' ' end)
moc_timer:start()

--moc widget buttons
tb_moc:buttons(awful.util.table.join(
	awful.button({ }, 1, function () moc_control("play_pause") end),
	awful.button({ }, 2, function () exec(teardrop("urxvtc -T moc -e mocp","center","center",800,600)) end),
	awful.button({ }, 3, function () moc_control("stop") end),
	awful.button({ }, 4, function () moc_control("next") end),
	awful.button({ }, 5, function () moc_control("previous") end)	
))


--==============================================================--

--                       PANEL CREATION                         --

--==============================================================--
-- Panel Config ----------------------------------------------
mywibox[s] = awful.wibox({
       position = "top",
       screen = s,
       height = beautiful.wibox_height,
       border_color = beautiful.border_panel,
       border_width = beautiful.border_width
 })
 my_bottom_wibox[s] = awful.wibox({
       position = "bottom",
       screen = s,
       height = beautiful.wibox_height,
       border_color = beautiful.border_panel,
       border_width = beautiful.border_width
 })
--------------------------------------------------------------

-- Add Widgets to the Panel ----------------------------------
    mywibox[s].widgets = {
        {
            mylauncher,mytaglist[s],mypromptbox[s],
            layout = awful.widget.layout.horizontal.leftright
        },
        mylayoutbox[s],spacer,
		datewidget,
		spacer,separator,spacer,
		volwidget,
		spacer,separator,spacer,
		batwidget,
		spacer,separator,spacer,
		--udisks_glue.widget,spacer,
		fsrwidget,
		spacer,separator,spacer,
        memwidget,
        spacer,separator,spacer,
        cpuwidget,
        spacer,separator,spacer,
        s == 1 and mysystray or nil,
        mytasklist[s],
        layout = awful.widget.layout.horizontal.rightleft
    }
    
    -- Add Widgets to the Panel ----------------------------------
    my_bottom_wibox[s].widgets = {
        {
        net,
        spacer,separator,spacer,
        aptwidget,
        spacer,separator,spacer,
        --mygmail,
        --spacer,separator,spacer,        
        tb_moc,
        layout = awful.widget.layout.horizontal.leftright
        },
        uptime,
        layout = awful.widget.layout.horizontal.rightleft
    }
end
--------------------------------------------------------------

my_bottom_wibox[1].visible = false


-- SHIFTY: initialize shifty
-- the assignment of shifty.taglist must always be after its actually
-- initialized with awful.widget.taglist.new()
shifty.taglist = mytaglist
shifty.init()
