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
    var contact: CNContact!
    override func viewDidLoad() {
        super.viewDidLoad()
        firstNameDetailContact.text = contact.givenName
        lastNameDetailContact.text = contact.familyName
//        if contact.phoneNumbers.count > 0 {
//            let number = contact.phoneNumbers[0].value
//            label.text = number.stringValue
//        
//        }
        phoneNumberDetailContact.text = "1230"
        emailDetailContact.text = "@"
       
    }
    

  

}
