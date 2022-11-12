//
//  AppDelegate.swift
//  CryptoViper
//
//  Created by Supapon Pucknavin on 12/11/2565 BE.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        let routerInstance = CryptoRouter.startExecution()
        let initialViewController = routerInstance.entry!
        
        let navigation = UINavigationController()
        navigation.viewControllers = [initialViewController]
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
        window?.rootViewController = navigation
        
        
        return true
    }

}

