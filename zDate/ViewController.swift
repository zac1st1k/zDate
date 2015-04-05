//
//  ViewController.swift
//  zDate
//
//  Created by Zac on 3/04/2015.
//  Copyright (c) 2015 1st1k. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var card = CardView(frame: CGRectMake(100.0, 100.0, 120.0, 200.0))
        self.view.addSubview(card)        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

