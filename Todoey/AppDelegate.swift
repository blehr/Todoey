//
//  AppDelegate.swift
//  Todoey
//
//  Created by Brandon Lehr on 2/15/19.
//  Copyright © 2019 Brandon Lehr. All rights reserved.
//

import UIKit
import CoreData
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
//    print(Realm.Configuration.defaultConfiguration.fileURL!)
        
        
        do {
            _ = try Realm()
        } catch {
            print("Error initializing realm \(error)")
        }
        
        return true
    }

}

