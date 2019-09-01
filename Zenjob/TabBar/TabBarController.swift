//
//  TabBarController.swift
//  Zenjob
//
//  Created by Awwad on 9/1/19.
//  Copyright © 2019 Awwad. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

  // MARK: - Properites

  var dispatcher: Dispatcher
  var user: User

  // MARK: - Initialization

  /**
   Initialize a new TabBarController.
   - Parameters:
     - dispatcher: Network dispatcher to perform network requests
     - user: The logged in user
   */
  init(dispatcher: Dispatcher, user: User) {
    self.dispatcher = dispatcher
    self.user = user

    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    self.setupView()
  }

  // MARK: - Methods

  // Set up the views' appearance
  func setupView() {
    self.tabBar.barTintColor = .white
    self.tabBar.isTranslucent = true
    self.tabBar.tintColor = .zenPurple

    let exploreVC = OffersViewController(dispatcher: dispatcher, user: user)
    let tasksVC = UIViewController()
    let jobsVC = UIViewController()
    let profileVC = UIViewController()

    exploreVC.tabBarItem = UITabBarItem(title: "Explore", image: UIImage(named: "explore"), tag: 0)
    tasksVC.tabBarItem = UITabBarItem(title: "Tasks", image: UIImage(named: "task"), tag: 1)
    jobsVC.tabBarItem = UITabBarItem(title: "Jobs", image: UIImage(named: "job"), tag: 2)
    profileVC.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(named: "profile"), tag: 3)

    self.viewControllers = [exploreVC, tasksVC, jobsVC, profileVC]
  }

}
