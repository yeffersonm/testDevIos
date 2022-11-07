//
//  AppDelegate.swift
//  TestDevIos
//
//  Created by MacBooK Pro on 23/09/22.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let initialModule = InitialModuleWireFrame.createInitialModuleModule()
        window = .init(frame: UIScreen.main.bounds)
        window?.rootViewController = initialModule
        window?.makeKeyAndVisible()
        return true
    }

}

