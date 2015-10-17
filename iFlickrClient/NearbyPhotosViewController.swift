import UIKit


class NearbyPhotosViewController: UICollectionViewController {

    @IBOutlet var imagesView: UICollectionView!
    var images = [UIImageView]()
    var fk = FlickrKit.sharedFlickrKit()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.fk.initializeWithAPIKey("93ce146f5889c40595052957db235a76", sharedSecret:"721d862aa6fecd8f");
        
        self.fk.call("flickr.photos.search", args: ["tags": "cat"]) { (response, error) -> Void in
            let photoPager = response["photos"] as! Dictionary<String, AnyObject>
            let photos = photoPager["photo"] as! Array<AnyObject>
            
            for photo in photos{
                var image = UIImageView()
                let url = self.fk.photoURLForSize(FKPhotoSizeSmall240, fromPhotoDictionary:photo as! [NSObject : AnyObject])
                image.setImageWithURL(url)
                self.images.append(image)
            }
            self.imagesView.reloadData()
        }
        
       // self.fk.call(apiMethod: String!, args: <#T##[NSObject : AnyObject]!#>) { (<#[NSObject : AnyObject]!#>, <#NSError!#>) -> Void in
         //   code
        //}
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        //#warning Incomplete method implementation -- Return the number of sections
        return 1
    }
    
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //#warning Incomplete method implementation -- Return the number of items in the section
        return self.images.count
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("NearbyCell", forIndexPath: indexPath) as! iFlickrClientCollectionViewCell
        
        // Configure the cell
        cell.imageView.image = self.images[indexPath.row].image
        cell.setNeedsDisplay()
        return cell
    }
}

