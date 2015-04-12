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
        PFFacebookUtils.logInWithPermissions(["public_profile", "user_about_me", "user_birthday"], block: { (user, error) -> Void in
            if user == nil {
                println("The user cancelled the Facebook Login.")
            }
            else if user.isNew {
                println("User signed up and logged in through Facebook!")
            }
            else {
                println("User logged in through Facebook!")
            }
        })
    }
}
