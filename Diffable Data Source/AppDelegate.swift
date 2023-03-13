//
//  AppDelegate.swift
//  Diffable Data Source
//
//  Created by MD. SHAYANUL HAQ SADI on 12/3/23.
//

import UIKit
import Rudder

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        //rudder config v2
        let writeKey = "2MwlD3XeA9errunTsvFWURLkcko"
        let dataPlaneUrl = "https://nexdecadevhx.dataplane.rudderstack.com"
        
//        let builder = RSConfig(writeKey: writeKey)
//         // .withDataPlaneUrl("https://nexdecadevhx.dataplane.rudderstack.com")
//        RSClient.initialize()
        
        let config: RSConfig = RSConfig(writeKey: writeKey)
                          .dataPlaneURL(dataPlaneUrl)
                          .trackLifecycleEvents(true)
                          .recordScreenViews(true)
                
        RSClient.sharedInstance().configure(with: config)
        
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

