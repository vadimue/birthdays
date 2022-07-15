//
//  PersonListViewController.swift
//  Birthdays
//
//  Created by Vadym Brusko on 15.07.2022.
//  
//

import UIKit

final class PersonListViewController: UIViewController, ViewControllerViewUnwrappable {
    var presenter: PersonListPresentation!
    lazy var customView: PersonListView = forciblyUnwrappedView()
    
    override func loadView() {
        view = PersonListView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Birthdays"
        presenter.onViewDidLoad()
    }
}

// MARK: -PersonListView Protocol
extension PersonListViewController: PersonListViewInterface {
    func setProvider(_ provider: TableViewProvider) {
        customView.tableView.dataSource = provider
        customView.tableView.delegate = provider
    }
    
    func reloadData() {
        customView.tableView.reloadData()
    }
    
    func showLoadingView() {
        customView.showLoadingView()
    }
    
    func hideLoadingView() {
        customView.hideLoadingView()
    }
}
