//
//  AppDelegate.swift
//  test2
//
//  Created by Rae  Lasko on 10/23/15.
//  Copyright © 2015 Rae  Lasko. All rights reserved.
//

import UIKit
import MessageUI

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var mailViewController = EmailManager()

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        let navigationBarAppearace = UINavigationBar.appearance()
        navigationBarAppearace.tintColor = UIColor.whiteColor()
        navigationBarAppearace.barTintColor = UIColor(colorLiteralRed: 0/255, green: 100/255, blue: 200/255, alpha: 1)
        
        UIApplication.sharedApplication().statusBarStyle = .LightContent
    

        return true
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
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
}


public class EmailManager : NSObject, MFMailComposeViewControllerDelegate
{
    var mailComposeViewController: MFMailComposeViewController?
    
    public override init()
    {
        mailComposeViewController = MFMailComposeViewController()
    }
    
    private func cycleMailComposer()
    {
        mailComposeViewController = nil
        mailComposeViewController = MFMailComposeViewController()
    }
    
    public func sendMailTo(emailList:[String], subject:String, attachment:NSData, body:String, fromViewController:UIViewController)
    {
        if MFMailComposeViewController.canSendMail() {
            mailComposeViewController!.setSubject(subject)
            mailComposeViewController!.setMessageBody(body, isHTML: false)
            mailComposeViewController?.addAttachmentData(attachment, mimeType: "text/plain", fileName: "myfile.txt")
            mailComposeViewController!.setToRecipients(emailList)
            mailComposeViewController?.mailComposeDelegate = self
            fromViewController.presentViewController(mailComposeViewController!, animated: true, completion: nil)
        }
        else {
            print("Could not open email app")
        }
    }
    
    public func mailComposeController(controller: MFMailComposeViewController, didFinishWithResult result: MFMailComposeResult, error: NSError?)
    {
        controller.dismissViewControllerAnimated(true) { () -> Void in
            self.cycleMailComposer()
        }
    }
}

