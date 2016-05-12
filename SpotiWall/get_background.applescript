script BackgroundPath
    on getPath()
        set picData to {}
        
        tell application "System Events"
            set picData to picData & {picture of current desktop}
        end tell
        
        tell application "Finder"
            set _b to bounds of window of desktop
            set _width to item 3 of _b
            set _height to item 4 of _b
            
            set picData to picData & {_width, _height}
        end tell
        
        return picData
    end getPath
end script

tell BackgroundPath to getPath()