//
//  FlickrAPI.swift
//  iFlickrClient
//
//  Created by Pavel on 10/17/15.
//  Copyright © 2015 Pavel. All rights reserved.
//

import Foundation

class FlickAPI{
 
    let API_KEY = "93ce146f5889c40595052957db235a76"
    let SHARED_SECRET = "721d862aa6fecd8f"
    
    var fk = FlickrKit.sharedFlickrKit()
    
    func loadImages(completion: (([FlickrPhoto]) -> Void)!){
        self.fk.initializeWithAPIKey("93ce146f5889c40595052957db235a76", sharedSecret:"721d862aa6fecd8f");
        
        self.fk.call("flickr.photos.search", args: ["tags": "shoes"]) { (response, error) -> Void in
            let photoPager = response["photos"] as! Dictionary<String, AnyObject>
            let photos = photoPager["photo"] as! Array<AnyObject>
            
            var result = [FlickrPhoto]()
            
            for photo in photos{
                let image = FlickrPhoto()
                let url = self.fk.photoURLForSize(FKPhotoSizeLargeSquare150, fromPhotoDictionary:photo as! [NSObject : AnyObject])
                
                image.url = url
                result.append(image)
            }
            
            let priority = DISPATCH_QUEUE_PRIORITY_DEFAULT
            dispatch_async(dispatch_get_global_queue(priority, 0), {
                dispatch_async(dispatch_get_main_queue(), {
                    completion(result)
                })
            })
        }
    }
    
}
