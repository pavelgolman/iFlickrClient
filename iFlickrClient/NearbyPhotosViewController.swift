import UIKit


class NearbyPhotosViewController: CommonSearchViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        api.curentTags = ["tags": "Ferrari"]
        api.searchImages(didLoadImages)
        
    }
    
    override func collectionCellIdentifier() -> String{
        return "NearbyCell";
    }

}

