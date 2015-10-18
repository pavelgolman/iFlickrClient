
class PhotoSearchViewController: CommonSearchViewController , UISearchBarDelegate {
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //api.loadImages(didLoadImages)
        
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
    
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.characters.count >= 3{
            print("search text is \(searchText)")
            self.api.searchImages(searchText, completion: didLoadImages)
        }else if self.images.count > 0{
            self.didLoadImages([FlickrPhoto]())
        }
        
    }

}

