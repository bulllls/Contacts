//
//  DetailContactViewController.swift
//  Сontacts
//
//  Created by Ruslan Filistovich on 30/12/2019.
//  Copyright © 2019 Ruslan Filistovich. All rights reserved.
//

import UIKit
import ContactsUI
class DetailContactViewController: UIViewController {
    @IBOutlet weak var imageDetailContact: UIImageView!
    @IBOutlet weak var firstNameDetailContact: UILabel!
    @IBOutlet weak var lastNameDetailContact: UILabel!
    @IBOutlet weak var phoneNumberDetailContact: UILabel!
    @IBOutlet weak var emailDetailContact: UILabel!
    var contact: Contact!
    override func viewDidLoad() {
        super.viewDidLoad()
        firstNameDetailContact.text = contact.firstName
        lastNameDetailContact.text = contact.lastName
        phoneNumberDetailContact.text = contact.phoneNumber
        emailDetailContact.text = contact.email
        if let data = contact.image {
            imageDetailContact.image = UIImage(data: data)
        }
    }
    

  

}
