
class PhotoSearchViewController: CommonSearchViewController , UISearchBarDelegate {
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let api = FlickAPI()
        api.loadImages(didLoadImages)
        
        let searchBar = UISearchBar()
        searchBar.delegate = self
        searchBar.sizeToFit()
        navigationItem.titleView = searchBar
        
    }
    
    override func collectionCellIdentifier() -> String{
        return "SearchCell";
    }

    
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        print("cancel button called")
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        print("search button called")
        
    }

}

