//
//  LoginViewController.swift
//  zDate
//
//  Created by Zac on 11/04/2015.
//  Copyright (c) 2015 1st1k. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func pressedFBLogin(sender: UIButton) {
        PFFacebookUtils.logInWithPermissions(["public_profile", "user_about_me", "user_birthday"], block: {
            (user, error) -> Void in
            if user == nil {
                println("The user cancelled the Facebook Login.")
            }
            else if user.isNew {
                println("User signed up and logged in through Facebook!")
                FBRequestConnection.startWithGraphPath("/me?fields=picture,first_name,birthday,gender", completionHandler: {
                    connection, result, error in
                    var r = result as NSDictionary
                    user["firstName"] = r["first_name"]
                    user["gender"] = r["gender"]
                    var dateFormatter = NSDateFormatter()
                    dateFormatter.dateFormat = "MM/dd/yyyy"
                    user["birthday"] = dateFormatter.dateFromString(r["birthday"] as String)
                    
                    let picutreURL = ((r["picture"] as NSDictionary)["data"] as NSDictionary) ["url"] as String
                    let url = NSURL(string: picutreURL)
                    let request = NSURLRequest(URL: url!)
                    NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue(), completionHandler: { (response, data, error) -> Void in
                        let imageFile = PFFile(name: "avatar.jpg", data: data)
                        user["picture"] = imageFile
                        user.saveInBackgroundWithBlock(nil)
                        
//                        if (response != nil) {
//                            println("Success")
//                        }
//                        else {
//                            println(error)
//                        }
                    })
//                    user.saveInBackgroundWithBlock({
//                        success, error in
//                        println(success)
//                        println(error)
//                    })
                })
            }
            else {
                println("User logged in through Facebook!")
            }
        })
    }
}