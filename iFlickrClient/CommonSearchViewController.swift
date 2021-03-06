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
        self.images += images
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
       
        let url = self.images[indexPath.row].thumbnailURL;
        
        cell.imageView.hidden = true
        cell.loading.startAnimating()
        
        cell.imageView.setImageWithURLRequest(
            NSURLRequest(URL: url),
            placeholderImage: nil,
            success: { (request: NSURLRequest, response, image: UIImage) -> Void in
                cell.imageView.image = image
                cell.loading.stopAnimating()
                cell.imageView.hidden = false
            }) { (request: NSURLRequest, response, error: NSError) -> Void in
                print(error.description)
        }
        
        cell.setNeedsDisplay()
        return cell
    }
    
    override func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        if offsetY - (contentHeight - scrollView.frame.size.height) > 10 {
            self.api.nextPage()
            self.api.searchImages(didLoadImages)
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let detailsViewController: PhotoDetailsViewController = segue.destinationViewController as? PhotoDetailsViewController {
            
            let selectedRow = imagesView.indexPathsForSelectedItems()?.last
            
            detailsViewController.photo = self.images[(selectedRow?.row)!]
            detailsViewController.hidesBottomBarWhenPushed = true
        }
    }
}
