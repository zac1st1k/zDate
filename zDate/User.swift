//
//  User.swift
//  zDate
//
//  Created by Zac on 13/04/2015.
//  Copyright (c) 2015 1st1k. All rights reserved.
//

import Foundation
import Parse

struct User {
    let id: String
    let pictureURL: String
    let name: String
    private let pfUser: PFUser
    
    func getPhoto(callback:(UIImage) -> ()) {
        let imageFile = pfUser.objectForKey("picutre") as PFFile
        imageFile.getDataInBackgroundWithBlock { (data, error) -> Void in
            if let data = data {
                callback(UIImage(data: data)!)
            }
        }
    }
}

private func pfUserToUser(user: PFUser) -> User {
    return User(id: user.objectId, pictureURL:
        user.objectForKey("picture") as String,
        name: user.objectForKey("firstName") as String,
        pfUser: user)
}

func currentUser() -> User? {
    if let user = PFUser.currentUser() {
        return pfUserToUser(user)
    }
    return nil
}