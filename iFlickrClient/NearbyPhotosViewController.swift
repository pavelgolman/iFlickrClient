import UIKit


class NearbyPhotosViewController: CommonSearchViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        api.curentTags = ["bbox": "-30,-50,20,50"]
        api.searchImages(didLoadImages)
        
    }
    
    override func collectionCellIdentifier() -> String{
        return "NearbyCell";
    }

}

