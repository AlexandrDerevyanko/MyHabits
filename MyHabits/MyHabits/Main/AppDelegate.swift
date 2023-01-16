//
//  AppDelegate.swift
//  MyHabits
//
//  Created by Aleksandr Derevyanko on 03.01.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

class TabBarController: UITabBarController {
    
    var firstTabNavigationController: UINavigationController!
    var secondTabNavigationController: UINavigationController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    private func setupUI() {
        firstTabNavigationController = UINavigationController.init(rootViewController: HabitsViewController())
        secondTabNavigationController = UINavigationController.init(rootViewController: InfoViewController())
        
        self.viewControllers = [firstTabNavigationController, secondTabNavigationController]
        
        let item1 = UITabBarItem(title: "Привычки",
                                 image: UIImage(systemName: "homekit"), tag: 0)
        let item2 = UITabBarItem(title: "Информация",
                                 image: UIImage(systemName: "square.and.arrow.down.fill"), tag: 1)
        
        firstTabNavigationController.tabBarItem = item1
        secondTabNavigationController.tabBarItem = item2
        
        UITabBar.appearance().tintColor = UIColor(red: 161/255.0, green: 22/255.0, blue: 204/255.0, alpha: 1.0)
        UITabBar.appearance().backgroundColor = UIColor(red: 242/255.0, green: 242/255.0, blue: 247/255.0, alpha: 1.0)
        
//        secondTabNavigationController.isNavigationBarHidden = true
        
    }
}
