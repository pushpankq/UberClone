//
//  AppDelegate.swift
//  Uber
//
//  Created by Puspank Kumar on 31/05/21.
//

import UIKit
import Firebase

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()

        
        window = UIWindow()
        window?.makeKeyAndVisible()
        window?.rootViewController = HomeViewController()
            
//            UINavigationController(rootViewController: LoginViewController())
        
            
        return true
    }


}

