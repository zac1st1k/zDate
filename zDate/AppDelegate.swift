//
//  AppDelegate.swift
//  zDate
//
//  Created by Zac on 3/04/2015.
//  Copyright (c) 2015 1st1k. All rights reserved.
//

import UIKit
import Parse

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        // [Optional] Power your app with Local Datastore. For more info, go to
        // https://parse.com/docs/ios_guide#localdatastore/iOS
        Parse.enableLocalDatastore()
        
        // Initialize Parse.
        Parse.setApplicationId("IJ26tuz0r9z9VNGj0lnkpoajTab9C2sjbPVeE8ME",
            clientKey: "R6Xf0opBLeaqmG0HWkBSBG077swgs6zaKzUhCbql")
        
        // Parse Test.
//        let testObject = PFObject(className: "TestObject")
//        testObject["foo"] = "bar"
//        testObject.save()
        
        PFFacebookUtils.initializeFacebook()
        var storyboard = UIStoryboard(name: "Main", bundle: nil)
        var initialViewController:UIViewController
        if currentUser() != nil {
            initialViewController = storyboard.instantiateViewControllerWithIdentifier("CardsNavController") as UIViewController
        }
        else {
            initialViewController = storyboard.instantiateViewControllerWithIdentifier("LoginViewController") as UIViewController
        }
        self.window?.rootViewController = initialViewController
        self.window?.makeKeyAndVisible()
        
        return true
    }
    
    func application(application: UIApplication, openURL url: NSURL, sourceApplication: String?, annotation: AnyObject?) -> Bool {
        return FBAppCall.handleOpenURL(url, sourceApplication: sourceApplication, withSession: PFFacebookUtils.session())
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        FBAppCall.handleDidBecomeActiveWithSession(PFFacebookUtils.session())
    }
    
    func applicationWillTerminate(application: UIApplication) {
        PFFacebookUtils.session().close()
    }
}

