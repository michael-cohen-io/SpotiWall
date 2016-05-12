//
//  Song.swift
//  SpotiWall2
//
//  Created by Michael Cohen on 5/11/16.
//  Copyright © 2016 Michael Cohen. All rights reserved.
//

import Cocoa

class Song: NSObject {

    let Artist, Song: String
    let Duration: Int
    var backgroundIDs: [Int] = []
    
    init(Artist: String, Song: String, Duration: Int){
        self.Artist = Artist
        self.Song = Song
        self.Duration = Duration
    }
    
    override var description: String {
        let minuteDuration = Duration.msToSeconds.minuteSecondMS
        return "Artist: \(Artist) \nSong: \(Song) \nDuration: \(minuteDuration)"
    }
}


extension NSTimeInterval {
    var minuteSecondMS: String {
        return String(format:"%d:%02d", minute, second)
    }
    var minute: Int {
        return Int(self/60.0 % 60)
    }
    var second: Int {
        return Int(self % 60)
    }
}

extension Int {
    var msToSeconds: Double {
        return Double(self) / 1000
    }
}