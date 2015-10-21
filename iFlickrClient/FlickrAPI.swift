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
    
    var currentPage = 1
    var curentTags = [String: String]()
    
    func nextPage(){
        self.currentPage++;
        print("CURRENT PAGE IS: " + String(self.currentPage))
    }
    
    func searchImages(completion: (([FlickrPhoto]) -> Void)!){
        self.fk.initializeWithAPIKey(self.API_KEY, sharedSecret:self.SHARED_SECRET);
        
        var args = self.curentTags
        args["page"] = String(self.currentPage)
        
        self.fk.call("flickr.photos.search", args: args) { (response, error) -> Void in
            if (response != nil) {
            
            let photoPager = response["photos"] as! Dictionary<String, AnyObject>
            let photos = photoPager["photo"] as! Array<AnyObject>
            
            var result = [FlickrPhoto]()
            
            for photo in photos{
                let image = FlickrPhoto()
     //           let url = self.fk.photoURLForSize(FKPhotoSizeLargeSquare150, fromPhotoDictionary:photo as! [NSObject : AnyObject])
                
                image.photo = photo
               
                result.append(image)
            }
            
            let priority = DISPATCH_QUEUE_PRIORITY_DEFAULT
            dispatch_async(dispatch_get_global_queue(priority, 0), {
                dispatch_async(dispatch_get_main_queue(), {
                    completion(result)
                })
                })
            }}
    }
    
}
