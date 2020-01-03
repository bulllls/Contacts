//
//  Contact.swift
//  Сontacts
//
//  Created by Ruslan Filistovich on 30/12/2019.
//  Copyright © 2019 Ruslan Filistovich. All rights reserved.
//

import Foundation

struct Contact {
    var image: Data?
    var firstName: String
    var lastName: String
    var phoneNumber: String
    var email: String
    var fullName: String {
        firstName + " \(lastName)"
    }
    init(image: Data?, firstName: String, lastName: String, phoneNumber: String, email: String){
        self.image = image
        self.firstName = firstName
        self.lastName = lastName
        self.phoneNumber = phoneNumber
        self.email = email
    }
}
