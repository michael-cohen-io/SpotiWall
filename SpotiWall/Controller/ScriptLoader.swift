//
//  ScriptLoader.swift
//  SpotiWall2
//
//  Created by Michael Cohen on 5/11/16.
//  Copyright © 2016 Michael Cohen. All rights reserved.
//

import Cocoa

class ScriptLoader: NSObject {
    let path: String
    let ext: String
    
    init(withSourcePath: String, ext: String) {
        self.path = withSourcePath
        self.ext = ext
    }

    func getScriptResponse() -> [String]{
        let filePath = NSBundle.mainBundle().pathForResource(self.path, ofType: self.ext)
        let fileData: NSString?
        do {
            fileData = try NSString(contentsOfFile: filePath!, encoding: NSUTF8StringEncoding)
        } catch _ {
            fileData = nil
        }
        
        var error: NSDictionary?
        var returnSet = [String]()
        if let scriptObject = NSAppleScript(source: fileData as! String){
            if let output: NSAppleEventDescriptor = scriptObject.executeAndReturnError(&error) {
                
                for index in 1...output.numberOfItems {
                    let descriptor = output.descriptorAtIndex(index)
                    if let descriptorStr = descriptor?.stringValue {
                        
                        returnSet.append(descriptorStr)
                    }
                }
                
            }
        }
        
        return returnSet
    }
}
