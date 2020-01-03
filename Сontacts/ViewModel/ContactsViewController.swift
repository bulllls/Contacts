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
    let getContacts = GetContacts()
    let cellIdAndNibName = "ContactTableViewCell"
    let searchController = UISearchController (searchResultsController: nil )
    var contacts = [Contact]()
    var filteredContacts = [Contact]()
    var searchBarIsEmpty: Bool {
        guard let text = searchController.searchBar.text else { return false }
        return text.isEmpty
    }
    var isFiltering: Bool {
        return searchController.isActive && !searchBarIsEmpty
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        contacts = getContacts.fetch()
        contactsTable.dataSource = self
        contactsTable.delegate = self
        contactsTable.register(UINib(nibName: cellIdAndNibName, bundle: nil), forCellReuseIdentifier: cellIdAndNibName)
        //search
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Contacts"
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }


}

extension ContactsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch isFiltering {
        case true:
            return filteredContacts.count
        default:
            return contacts.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = contactsTable.dequeueReusableCell(withIdentifier: cellIdAndNibName) as? ContactTableViewCell else { return UITableViewCell()}
        var contact: Contact
        switch isFiltering {
        case true:
            contact = filteredContacts[indexPath.row]
        default:
            contact = contacts[indexPath.row]
        }
        cell.lastNameContact.text = contact.firstName
        cell.firstNameContact.text = contact.lastName
        cell.phoneNumberContact.text = contact.phoneNumber
        cell.emailContact.text = contact.email
        if let data = contact.image {
            cell.imageContact.image = UIImage(data: data)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = storyboard.instantiateViewController(identifier: "DetailContactViewController") as? DetailContactViewController else {  return }
        let contact: Contact
        switch isFiltering {
        case true:
            contact = filteredContacts[indexPath.row]
        default:
            contact = contacts[indexPath.row]
        }
        vc.contact = contact
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension ContactsViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
    func filterContentForSearchText(_ searchText: String) {
        filteredContacts = contacts.filter({ (contact: Contact) -> Bool in
            return contact.fullName.lowercased().contains(searchText.lowercased())
        })
        contactsTable.reloadData()
    }
}
