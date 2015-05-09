//
//  UserCell.swift
//  zDate
//
//  Created by Zac on 7/05/2015.
//  Copyright (c) 2015 1st1k. All rights reserved.
//

import UIKit

class UserCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        avatarImageView.layer.cornerRadius = avatarImageView.frame.height / 2
        avatarImageView.layer.masksToBounds = true
    }
    
    navigationItem.titleView = UIImageView(image: UIImage(named: "chat-header"))
    let leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "nav-back-button"), style: UIBarButtonItemStyle.Plain, target: self, action: "goToPreviousVC:")
    navigationItem.setLeftBarButtonItem(leftBarButtonItem, animated: true)
    func goToPreviousVC(button: UIBarButtonItem) {
        pageController.goToPreviousVC()
    }

}
