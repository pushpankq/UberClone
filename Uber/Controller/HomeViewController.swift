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
    
    override func viewDidLoad() {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            self.checkIfUserIsLoggedIn()

        }
//        signOut()
    }
}

extension HomeViewController {
    private func checkIfUserIsLoggedIn() {
        
        let uid = Auth.auth().currentUser?.uid
        print("uid ", uid)
        if  uid == nil {
            
            let loginViewController = UINavigationController(rootViewController: LoginViewController())
            loginViewController.modalPresentationStyle = .fullScreen
            self.present(loginViewController, animated: true)
        } else {
            configureVIew()
        }
    }
    
    private func signOut() {
        do {
            try Auth.auth().signOut()
        } catch let error {
            debugPrint("error is ", error.localizedDescription)
        }
    }
    
    func configureVIew() {
        view.addSubview(mapView)
        mapView.frame = view.frame
    }
}
