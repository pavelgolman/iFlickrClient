import UIKit


class NearbyPhotosViewController: CommonSearchViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        api.loadImages(didLoadImages)
        
    }
    
    override func collectionCellIdentifier() -> String{
        return "NearbyCell";
    }

}

