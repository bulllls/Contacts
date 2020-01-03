//
//  GetContacts.swift
//  Сontacts
//
//  Created by Ruslan Filistovich on 03/01/2020.
//  Copyright © 2020 Ruslan Filistovich. All rights reserved.
//


import ContactsUI

struct GetContacts {
    func fetch() -> [Contact] {
        let contactStore = CNContactStore()
        let keys = [
            CNContactFormatter.descriptorForRequiredKeys(for: .fullName),
            CNContactPhoneNumbersKey,
            CNContactEmailAddressesKey,
            CNContactImageDataKey
            ] as [Any]
        let request = CNContactFetchRequest(keysToFetch: keys as! [CNKeyDescriptor])
        var contacts = [Contact]()
        do {
            try contactStore.enumerateContacts(with: request){
                (contact, stop) in
                var firstName = "no name"
                if contact.givenName.count > 0 {
                    firstName = contact.givenName
                }
                var lastName = ""
                if contact.familyName.count > 0 {
                    lastName = contact.familyName
                }
                var phone = "no phone"
                if contact.phoneNumbers.count != 0 {
                    phone = (contact.phoneNumbers[0].value as CNPhoneNumber).stringValue
                }
                var email = "no E-mail"
                if contact.emailAddresses.count != 0 {
                    email = contact.emailAddresses[0].value as String
                }
                contacts.append(Contact(image:  contact.imageData,
                                        firstName: firstName,
                                        lastName: lastName,
                                        phoneNumber: phone,
                                        email: email
                ))
            }
            //print(contacts)
        } catch {
            print("unable to fetch contacts")
        }
        return contacts
    }
}
