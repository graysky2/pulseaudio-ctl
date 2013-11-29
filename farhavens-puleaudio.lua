
 function volume (mode, widget)
     local cardid  = 0
     local channel = "Master"
     if mode == "update" then

         local status = io.popen("pulseaudio-ctl status"):read("*all")
         local volume = tonumber(string.match(status, "(%d?%d?%d) %%"))
	 status = string.match(status, "(muted : [noyes]*)")
 
         local color = "#FF0000"
         if string.find(status, "muted : no", 1, true) then
             color = "#00FF00"
         end
	 status = ""
         for i = 1, math.floor(volume / 10) do
             status = status .. "|"
         end
         for i = math.floor(volume / 10) + 1, 10 do
             status = status .. "-"
         end
         status = "-[" ..status .. "]+"
         widget.text = "<span color=\"" .. color .. "\">" .. status .. "</span>|"
     elseif mode == "up" then
         os.execute("pulseaudio-ctl up")
         volume("update", widget)
     elseif mode == "down" then
         os.execute("pulseaudio-ctl down")
         volume("update", widget)
     else
         os.execute("pulseaudio-ctl mute")
         volume("update", widget)
     end
 end
