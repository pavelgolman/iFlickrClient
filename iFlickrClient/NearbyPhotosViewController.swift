import UIKit


class NearbyPhotosViewController: CommonSearchViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let api = FlickAPI()
        api.loadImages(didLoadImages)
        
    }
    
    override func collectionCellIdentifier() -> String{
        return "NearbyCell";
    }

}

