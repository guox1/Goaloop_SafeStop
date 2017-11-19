//
//  ViewController.swift
//  SafeStop
//
//  Created by Jacky on 10/11/17.
//  Copyright © 2017 Goaloop. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var mapView: MKMapView!
    var locationManager:CLLocationManager!
    var userLocation: CLLocationCoordinate2D?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    @IBAction func myLocationButton(_ sender: Any) {
        
        determineCurrentLocation()
    }
    
    @IBAction func toSafeStopButton(_ sender: Any) {
        
        getDirection()
    }
    
    @IBAction func logoutButtonTapped(_ sender: Any) {
        UserDefaults.standard.set(false, forKey: "isUserLoggedIn")
        UserDefaults.standard.synchronize()
        self.performSegue(withIdentifier: "loginView", sender: self)
        
    }
    func getDirection() {
        //let location = self.safestop["..."]
        let coordinate = CLLocationCoordinate2DMake(userLocation!.latitude, userLocation!.longitude)
        let mapItem = MKMapItem(placemark: MKPlacemark(coordinate: coordinate, addressDictionary:nil))
        mapItem.name = "Fred Meyer"
        //mapItem.openInMaps(launchOptions: [MKLaunchOptionsDirectionsModeKey : MKLaunchOptionsDirectionsModeDriving])
        let options = [
            MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving
        ]
        MKMapItem.openMaps(with: [mapItem], launchOptions: options)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let isUserLoggedIn = UserDefaults.standard.bool(forKey: "isUserLoggedIn")
        if (!isUserLoggedIn) {
            self.performSegue(withIdentifier: "loginView", sender: self)
        }
        
        determineCurrentLocation()
        
    }
    
    func determineCurrentLocation() {
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        //let userLocation:CLLocation = locations[0]
        
        let locValue:CLLocationCoordinate2D = manager.location!.coordinate
        userLocation = locValue
        
        // Call stopUpdatingLocation() to stop listening for location updates,
        // other wise this function will be called every time when user location changes.
        //manager.stopUpdatingLocation()
        
        let center = CLLocationCoordinate2D(latitude: userLocation!.latitude, longitude: userLocation!.longitude)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
        
        mapView.setRegion(region, animated: true)
        
        // Drop a pin at user's Current Location
        /*let myAnnotation: MKPointAnnotation = MKPointAnnotation()
        myAnnotation.coordinate = CLLocationCoordinate2DMake(userLocation.coordinate.latitude, userLocation.coordinate.longitude);
        myAnnotation.title = "Current location"
        mapView.addAnnotation(myAnnotation)
         */
    }
    
    /*private func locationManager(_ manager: CLLocationManager, didFailWithError error: NSError)
    {
        print("Error \(error)")
    }*/

}

