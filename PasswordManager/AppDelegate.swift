//
//  AppDelegate.swift
//  PasswordManager
//
//  Created by Hamza Ansari on 08/08/15.
//  Copyright (c) 2015 HamzaAnsari. All rights reserved.
//

import UIKit
import SwiftKeychainWrapper

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    
    if KeychainWrapper.standard.string(forKey: Keys.master) == nil{
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let registerView = storyboard.instantiateViewController(withIdentifier: "RegisterViewController")
        window?.rootViewController = registerView
    }
    
    // Override point for customization after application launch.
    return true
  }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let registerView = storyboard.instantiateViewController(withIdentifier: "LoginViewController")
        window?.rootViewController = registerView
    }
}

