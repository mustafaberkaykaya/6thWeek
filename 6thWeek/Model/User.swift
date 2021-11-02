//
//  User.swift
//  6thWeek
//
//  Created by Mustafa Berkay Kaya on 2.11.2021.
//

import Foundation

enum Status {
    case succes
    case failed
}

struct AppUser {
    var name: String
    var userStatus: Status
    var age: Int
}
