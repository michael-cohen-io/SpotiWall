script SpotifyScriptObj
	on getSong()
		tell application "Spotify"
			set cArtist to artist of current track as string
			set cSong to name of current track as string
            set cDuration to duration of current track as string
			set response to {cArtist, cSong, cDuration}
			log response
			return response
		end tell
	end getSong
end script

tell SpotifyScriptObj to getSong()