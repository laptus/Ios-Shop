//
//  AppDelegate.swift
//  Shop
//
//  Created by Laptev Sasha on 02/07/2018.
//  Copyright © 2018 Laptev Sasha. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var requestFactory: GBShopRequestFactory
    
    override init() {
        requestFactory = GBShopRequestFactory()
        super.init()
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions
        launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let auth = requestFactory.makeShopRequestsFactory()
        auth.good(goodId: 1, completionHandler: {response in
            switch response.result {
            case .success(let login):
                print(login)
            case .failure(let error):
                print(error)
            }
        })
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
    }

    func applicationWillTerminate(_ application: UIApplication) {
    }


}
