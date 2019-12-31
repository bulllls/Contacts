//
//  ContactTableViewCell.swift
//  Сontacts
//
//  Created by Ruslan Filistovich on 30/12/2019.
//  Copyright © 2019 Ruslan Filistovich. All rights reserved.
//

import UIKit

class ContactTableViewCell: UITableViewCell {

    @IBOutlet weak var imageContact: UIImageView!
    @IBOutlet weak var lastNameContact: UILabel!
    @IBOutlet weak var firstNameContact: UILabel!
    @IBOutlet weak var phoneNumberContact: UILabel!
    @IBOutlet weak var emailContact: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
