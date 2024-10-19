//
//  AppDelegate.swift
//  Rick and Morty
//
//  Created by Khaled hashem on 19/10/2024.
//

import UIKit
import SwiftUI

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var appCoordinator: AppCoordinator?
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let navigationController = UINavigationController()
        let appDependencyContainer = AppDependencyContainer()
        let window = UIWindow(frame: UIScreen.main.bounds)
        appCoordinator = AppCoordinator(navigationController: navigationController,
                                        characterListDependencyContainer: appDependencyContainer.characterListDependencyContainer)
        appCoordinator?.start()
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        self.window = window

        return true
    }
    
}
