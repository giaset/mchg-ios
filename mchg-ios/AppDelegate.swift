//
//  AppDelegate.swift
//  mchg-ios
//
//  Created by Gianni Settino on 2016-12-04.
//  Copyright © 2016 Milton and Parc. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.rootViewController = FeedViewController()
        return true
    }
}
