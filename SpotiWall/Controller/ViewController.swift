//
//  ViewController.swift
//  SpotiWall2
//
//  Created by Michael Cohen on 5/11/16.
//  Copyright © 2016 Michael Cohen. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    let spotifyScriptName = "get_spotify_data"
    let getBackgroundScriptName = "get_background"
    let scriptExt = "applescript"
    
    //TODO: Parameterize HTTP request with width, height
    var screenBackgroundPath = "", screenWidth = "", screenHeight = ""

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getCurrentBackground()
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBAction func onBtnSwitchClick(sender: AnyObject) {
        let btn = sender as! NSButton
        let tmpTitle = btn.title
        btn.title = btn.alternateTitle
        btn.alternateTitle = tmpTitle
        
        if btn.state == 0 {
            //Return back to default background
            return
        }
        
        var songData = getSpotifyData()
        let songDuration: Int? = Int(songData[2])
        var cSong = Song(Artist: songData[0], Song: songData[1], Duration: songDuration!)
        
        var imgUrl = getImagesURLs(cSong)
    }

    func getSpotifyData() -> [String] {
        let loader = ScriptLoader(withSourcePath: spotifyScriptName, ext: scriptExt)
        return loader.getScriptResponse()
    }
    
    func getCurrentBackground(){
        let loader = ScriptLoader(withSourcePath: getBackgroundScriptName, ext: scriptExt)
        let dataSet = loader.getScriptResponse()
        self.screenBackgroundPath = dataSet[0]
        self.screenWidth = dataSet[1]
        self.screenHeight = dataSet[2]
       
    }
    
    func getImagesURLs(song: Song) -> [NSURL]{
        let apiRequest = ImageApiRequest(queryString: song.Artist)
        let urls = [NSURL]()
        apiRequest.getApiResponse()
        return urls
    }
}

