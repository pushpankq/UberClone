//
//  HomeViewController.swift
//  Uber
//
//  Created by Pushpank Kumar on 20/06/21.
//

import UIKit
import Firebase
import MapKit

class HomeViewController: UIViewController {
    
    let mapView = MKMapView()
    private let locationManager = CLLocationManager()
    
    
    override func viewDidLoad() {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            self.checkIfUserIsLoggedIn()

        }
        
        enableLocationSerivecs()
//        signOut()
    }
}

extension HomeViewController {
    func configureVIew() {
        configureMapView()
    }
    
    private func configureMapView() {
        view.addSubview(mapView)
        mapView.frame = view.frame
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .follow
    }
    
}

private extension HomeViewController {
     func checkIfUserIsLoggedIn() {
        
        let uid = Auth.auth().currentUser?.uid
        if  uid == nil {
            let loginViewController = UINavigationController(rootViewController: LoginViewController())
            loginViewController.modalPresentationStyle = .fullScreen
            self.present(loginViewController, animated: true)
        } else {
            configureVIew()
        }
    }
    
     func signOut() {
        do {
            try Auth.auth().signOut()
        } catch let error {
            debugPrint("error is ", error.localizedDescription)
        }
    }
    
   
    func enableLocationSerivecs() {
        
        locationManager.delegate = self
        
        switch locationManager.authorizationStatus  {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            debugPrint("restricted")
        case .denied:
            debugPrint("denied")
        case .authorizedAlways:
            locationManager.startUpdatingLocation()
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
        case .authorizedWhenInUse:
            locationManager.requestAlwaysAuthorization()
        @unknown default:
            debugPrint("default")
        }
    }
}


extension HomeViewController: CLLocationManagerDelegate {
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        if manager.authorizationStatus == .authorizedWhenInUse {
            locationManager.requestAlwaysAuthorization()
        }
    }
}
