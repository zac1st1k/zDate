//
//  CardsViewController.swift
//  zDate
//
//  Created by Zac on 5/04/2015.
//  Copyright (c) 2015 1st1k. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController, SwipeViewDelegate {
    
    let frontCardTopMargin: CGFloat = 0
    let backCardTopMargin: CGFloat = 10
    @IBOutlet weak var cardStackView: UIView!
    
    var backCard: SwipeView?
    var frontCard: SwipeView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        cardStackView.backgroundColor = UIColor.clearColor()
        backCard = SwipeView(frame: createCardFrame(backCardTopMargin))
        backCard?.delegate = self
        cardStackView.addSubview(backCard!)
        frontCard = SwipeView(frame: createCardFrame(frontCardTopMargin))
        frontCard?.delegate = self
        cardStackView.addSubview(frontCard!)
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
    
    private func createCardFrame(topMargin: CGFloat) -> CGRect {
        return CGRect(x: 0, y: topMargin, width: cardStackView.frame.width, height: cardStackView.frame.height)
    }
    
    // MARK: - SwipeDelegate
    
    func swipedLeft() {
        println("left")
        if let frontCard = frontCard {
            frontCard.removeFromSuperview()
        }
    }
    
    func swipedRight() {
        println("right")
        if let frontCard = frontCard {
            frontCard.removeFromSuperview()
        }
    }
}
