import Foundation
import UIKit


class CommonSearchViewController : UICollectionViewController {
    
    @IBOutlet var imagesView: UICollectionView!
    
    let api = FlickAPI()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

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

extension CommonSearchViewController: UICollectionViewDelegateFlowLayout {
    // MARK:- UICollectioViewDelegateFlowLayout methods
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize
    {
        // http://stackoverflow.com/questions/28872001/uicollectionview-cell-spacing-based-on-device-sceen-size
        
        let length = (UIScreen.mainScreen().bounds.width-15)/4
        return CGSizeMake(length,length);
    }
}
