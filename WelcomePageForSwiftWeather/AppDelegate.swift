//
//  AppDelegate.swift
//  WelcomePageForSwiftWeather
//
//  Created by k&r on 16/1/31.
//  Copyright © 2016年 k&r. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {   //AppDelegate用于监听整个APP的事件

  var window: UIWindow?

  func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
    // Override point for customization after application launch.    //APP启动完成后调用
    
    //判断是否第一次启动
    if(!NSUserDefaults.standardUserDefaults().boolForKey("firstLaunch")) {
      self.window?.rootViewController = ViewController() //第一次启动进入根视图
      self.window?.makeKeyAndVisible() //把视图显示出来
      NSUserDefaults.standardUserDefaults().setBool(true, forKey: "firstLaunch")  //启动过启动页之后,把默认Boolean变成true
    } else {
      let sb = UIStoryboard(name: "Main", bundle: nil) //获取了Main storyboard，才能获取storyboard下的second以ID的ViewControllor
      let second = sb.instantiateViewControllerWithIdentifier("second") as! UIViewController //强制转换为UIViewController
      self.window?.rootViewController = second //把second设置为根视图
      NSUserDefaults.standardUserDefaults().setBool(true, forKey: "firstLaunch")  //把默认布尔值变成true
    }
    
    return true
  }

  func applicationWillResignActive(application: UIApplication) {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
  }

  func applicationDidEnterBackground(application: UIApplication) {   //APP进入后台时调用
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
  }

  func applicationWillEnterForeground(application: UIApplication) {   //APP进入前台时调用
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
  }

  func applicationDidBecomeActive(application: UIApplication) {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
  }

  func applicationWillTerminate(application: UIApplication) {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
  }


}

