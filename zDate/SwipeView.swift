//
//  SwipeView.swift
//  zDate
//
//  Created by Zac on 4/04/2015.
//  Copyright (c) 2015 1st1k. All rights reserved.
//

import Foundation
import UIKit

class SwipeView: UIView {
    
    private let card: CardView = CardView()
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialize()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    override init() {
        super.init()
        initialize()
    }
    
    private func initialize() {
        self.backgroundColor = UIColor.clearColor()
        addSubview(card)
        setConstrains()
    }
    
    private func setConstrains() {
        
    }
}