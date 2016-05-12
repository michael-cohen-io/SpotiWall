//
//  ImageApiRequest.swift
//  SpotiWall2
//
//  Created by Michael Cohen on 5/11/16.
//  Copyright © 2016 Michael Cohen. All rights reserved.
//

import Cocoa
import SwiftyJSON

class ImageApiRequest: NSObject {

    
    let url: NSURL
    let query: String
    init(queryString: String){
        self.query = queryString
        let urlString = "https://bingapis.azure-api.net/api/v5/images/search?q=\(query)&size=wallpaper"
        self.url = NSURL(string: urlString)!
    }
    
    func getApiResponse() -> String{
        
        let request = NSMutableURLRequest(URL: self.url)
        let session = NSURLSession.sharedSession()
        
        request.HTTPMethod = "GET"
        request.cachePolicy = NSURLRequestCachePolicy.ReloadIgnoringCacheData
        request.addValue("afdbb30612da486ea5548563d03fa223", forHTTPHeaderField: "Ocp-Apim-Subscription-Key")
        
        let task = session.dataTaskWithRequest(request) {
            (
            let data, let response, let error) in
            
            guard let _:NSData = data, let _:NSURLResponse = response  where error == nil else {
                print("error")
                return
            }
            
            let json = self.getJSON(data!)
            for (index,subJson):(String, JSON) in json {
                print("Height: \(subJson["height"]) Width: \(subJson["width"])\n")
            }
        }
        task.resume()
        return "1"
    }
    
    private func getJSON(response: NSData) -> JSON{
        let json = JSON(data: response)
        return json["value"]
    }
}
