
import UIKit

class iFlickrClientCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    
    var url : NSURL?
    
    override func prepareForReuse()
    {
        super.prepareForReuse()
        self.imageView.image = nil
    }
}
