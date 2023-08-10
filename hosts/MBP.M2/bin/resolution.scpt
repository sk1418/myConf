do shell script "open x-apple.systempreferences:com.apple.preference.displays"
tell application "System Events"
    tell application process "System Settings"
        repeat until (exists UI element 1 of group 1 of scroll area 2 of group 1 of group 2 of splitter group 1 of group 1 of window 1)
            delay 0.1
        end repeat
        tell window 1 #"Displays"
            --set displayOptions to UI element 1 of group 1 of scroll area 2 of group 1 of group 2 of splitter group 1 of group 1
            set displayOptions to UI element 3 of group 1 of scroll area 2 of group 1 of group 2 of splitter group 1 of group 1
            set StandardRes to button 4 of displayOptions
            set MoreSpaceRes to button 5 of displayOptions
            
            if focused of StandardRes is false then
                click StandardRes
            else
                click MoreSpaceRes
            end if
        end tell
    end tell
end tell
quit application "System Settings"
