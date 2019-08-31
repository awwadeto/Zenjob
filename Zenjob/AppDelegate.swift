//
//  AppDelegate.swift
//  Zenjob
//
//  Created by Awwad on 8/31/19.
//  Copyright © 2019 Awwad. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  var environment: Environment
  var dispatcher: NetworkDispatcher

  override init() {
    environment = Environment("staging", host: "https://staging-main.zenjob.org/api/employee/v1")
    dispatcher = NetworkDispatcher(environment: environment)
  }

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    // Override point for customization after application launch.

    let loginTask = LoginTask(username: "mobile@zenjob.com", password: "becreative")
    loginTask.execute(in: dispatcher) { [weak self] (user, error) in
      if let error = error {
        print("error in LoginTast \(error.localizedDescription)")
      }

      if let user = user {
        DispatchQueue.main.async {
          UserDefaults.standard.set(user.accessToken, forKey: "accessToken")
          // Initialize the window
          self?.window = UIWindow(frame: UIScreen.main.bounds)

          // Set Background Color of window
          self?.window?.backgroundColor = .darkGray

          // Allocate memory for an instance of the 'OffersViewController' class
          let offersViewController = OffersViewController(dispatcher: self!.dispatcher, user: user)
          let navController = UINavigationController(rootViewController: offersViewController)
          navController.navigationBar.barTintColor = .almostWhite
          navController.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.zenPurple]
          navController.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.zenPurple]
          navController.navigationBar.tintColor = .zenPurple
          navController.navigationBar.prefersLargeTitles = true

          // Set the root view controller of the app's window
          self?.window!.rootViewController = navController

          // Make the window visible
          self?.window!.makeKeyAndVisible()
        }

      }
    }
    return true
  }

  func applicationWillResignActive(_ application: UIApplication) {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
  }

  func applicationDidEnterBackground(_ application: UIApplication) {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
  }

  func applicationWillEnterForeground(_ application: UIApplication) {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
  }

  func applicationDidBecomeActive(_ application: UIApplication) {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
  }

  func applicationWillTerminate(_ application: UIApplication) {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
  }


}

