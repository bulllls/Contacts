//
//  ViewController.swift
//  Сontacts
//
//  Created by Ruslan Filistovich on 30/12/2019.
//  Copyright © 2019 Ruslan Filistovich. All rights reserved.
//

import UIKit
import ContactsUI
class ContactsViewController: UIViewController {
    
    @IBOutlet weak var contactsTable: UITableView!
    var contacts = [Contact]()
    let searchController = UISearchController (searchResultsController: nil )
    let cellId = "ContactTableViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let contactStore = CNContactStore()
        let keys = [
            CNContactFormatter.descriptorForRequiredKeys(for: .fullName),
            CNContactPhoneNumbersKey,
            CNContactEmailAddressesKey,
            CNContactImageDataKey
            ] as [Any]
        let request = CNContactFetchRequest(keysToFetch: keys as! [CNKeyDescriptor])
        do {
            try contactStore.enumerateContacts(with: request){
                (contact, stop) in
                let name = contact.givenName
                let lastName = contact.familyName
                let phone = (contact.phoneNumbers[0].value as CNPhoneNumber).stringValue
                var email = "no E-mail"
                if contact.emailAddresses.count != 0 {
                    email = contact.emailAddresses[0].value as String
                }
                self.contacts.append(Contact(image: contact.imageData, firstName: name, lastName: lastName, phoneNumber: phone, email: email))
            }
            //print(contacts)
        } catch {
            print("unable to fetch contacts")
        }
        
        contactsTable.dataSource = self
        contactsTable.delegate = self
        contactsTable.register(UINib(nibName: "ContactTableViewCell", bundle: nil), forCellReuseIdentifier: cellId)
    }


}

extension ContactsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = contactsTable.dequeueReusableCell(withIdentifier: cellId) as? ContactTableViewCell else { return UITableViewCell()}

        cell.lastNameContact.text = contacts[indexPath.row].firstName
        cell.firstNameContact.text = contacts[indexPath.row].lastName
        cell.phoneNumberContact.text = contacts[indexPath.row].phoneNumber
        cell.emailContact.text = contacts[indexPath.row].email
        if let data = contacts[indexPath.row].image {
            cell.imageContact.image = UIImage(data: data)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = storyboard.instantiateViewController(identifier: "DetailContactViewController") as? DetailContactViewController else {  return }
        vc.contact = contacts[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension ContactsViewController: UISearchResultsUpdating {
  func updateSearchResults(for searchController: UISearchController) {
    // TODO
  }
}
