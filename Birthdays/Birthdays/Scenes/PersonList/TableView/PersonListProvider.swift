//
//  PersonListProvider.swift
//  Birthdays
//
//  Created by Vadym Brusko on 15.07.2022.
//

import Foundation
import UIKit

protocol TableViewProvider: UITableViewDataSource, UITableViewDelegate {}

protocol PersonListProviderDelegate: AnyObject {
    func didSelectCell(_ person: Person)
}

class PersonListProvider: NSObject, TableViewProvider {
    var data = [Person]()
    weak var delegate: PersonListProviderDelegate?

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PersonTableViewCell", for: indexPath) as? PersonTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(from: data[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        delegate?.didSelectCell(data[indexPath.item])
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
}
