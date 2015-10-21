import UIKit
import CoreLocation

class NearbyPhotosViewController: CommonSearchViewController, CLLocationManagerDelegate {

    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestAlwaysAuthorization()
        self.locationManager.startUpdatingLocation()
        
    }
    
    override func collectionCellIdentifier() -> String{
        return "NearbyCell";
    }
    
    func locationWithBearing(bearing:Double, distanceMeters:Double, origin:CLLocationCoordinate2D) -> CLLocationCoordinate2D {
        let distRadians = distanceMeters / (6372797.6)
        
        let rbearing = bearing * M_PI / 180.0
        
        let lat1 = origin.latitude * M_PI / 180
        let lon1 = origin.longitude * M_PI / 180
        
        let lat2 = asin(sin(lat1) * cos(distRadians) + cos(lat1) * sin(distRadians) * cos(rbearing))
        let lon2 = lon1 + atan2(sin(rbearing) * sin(distRadians) * cos(lat1), cos(distRadians) - sin(lat1) * sin(lat2))
        
        return CLLocationCoordinate2D(latitude: lat2 * 180 / M_PI, longitude: lon2 * 180 / M_PI)
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]){
        let location = locations[locations.count - 1] as CLLocation
        
        let min = self.locationWithBearing(225, distanceMeters: 1000.0, origin: location.coordinate)
        let max = self.locationWithBearing(45, distanceMeters: 1000.0, origin: location.coordinate)
        
        print("CENTER: " + String(location.coordinate.latitude)+";"+String(location.coordinate.longitude))
        print("MIN: " + String(min.latitude)+";"+String(min.longitude))
        print("MAX: " + String(max.latitude)+";"+String(max.longitude))
        
        let minLat = String(min.latitude)
        let minLong = String(min.longitude)

        let maxLat = String(max.latitude)
        let maxLong = String(max.longitude)
        
        self.locationManager.stopUpdatingLocation()
        
        api.curentTags = ["bbox": minLong + ","+minLat+","+maxLong+","+maxLat]
        api.searchImages(didLoadImages)
        
        navigationItem.title = "Your location: " + String(location.coordinate.latitude)+";"+String(location.coordinate.longitude)
        
    }

}

