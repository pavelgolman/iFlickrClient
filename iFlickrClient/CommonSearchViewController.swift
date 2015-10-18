import Foundation
import UIKit


class CommonSearchViewController : UICollectionViewController {
    
    @IBOutlet var imagesView: UICollectionView!
    var images = [FlickrPhoto]()
    
    func didLoadImages(images: [FlickrPhoto]){
        self.images = images
        self.imagesView.reloadData()
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
    
    func collectionCellIdentifier() -> String{
        return "";
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(self.collectionCellIdentifier(), forIndexPath: indexPath) as! iFlickrClientCollectionViewCell
        
        // Configure the cell
        //cell.imageView.image = self.images[indexPath.row].image
        cell.imageView.setImageWithURL(self.images[indexPath.row].url!)
        
        cell.setNeedsDisplay()
        return cell
    }
}
