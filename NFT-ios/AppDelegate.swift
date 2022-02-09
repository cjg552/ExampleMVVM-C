//
//  AppDelegate.swift
//  NFT-ios
//
//  Created by Carlos Jimenez on 17/1/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    var appCoodinator: AppCoordinator!


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        appCoodinator = AppCoordinator(window: window)
        appCoodinator.start()
        return true
    }
}

