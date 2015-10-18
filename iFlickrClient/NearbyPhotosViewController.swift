import UIKit


class NearbyPhotosViewController: CommonSearchViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        api.curentTags = ["tags": "wood"]
        api.searchImages(didLoadImages)
        
    }
    
    override func collectionCellIdentifier() -> String{
        return "NearbyCell";
    }

}

