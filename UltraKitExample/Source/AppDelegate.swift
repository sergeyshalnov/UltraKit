//
//  AppDelegate.swift
//  UltraKitExample
//
//  Created by Sergey Shalnov on 04.02.2021.
//

import UIKit.UIResponder

@main
final class AppDelegate: UIResponder {

    // MARK: - Public Properties

    lazy var window: UIWindow? = {
        let window = UIWindow(frame: UIScreen.main.bounds)

        window.tintColor = .black

        return window
    }()

}

// MARK: - UIApplicationDelegate

extension AppDelegate: UIApplicationDelegate {

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        window?.rootViewController = ViewController()
        window?.makeKeyAndVisible()

        return true
    }

}
