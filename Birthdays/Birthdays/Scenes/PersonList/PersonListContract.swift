//
//  PersonListContract.swift
//  Birthdays
//
//  Created by Vadym Brusko on 15.07.2022.
//  
//

protocol PersonListViewInterface: AnyObject {
    func setProvider(_ provider: TableViewProvider)
    func reloadData()
    func showLoadingView()
    func hideLoadingView()
}

protocol PersonListPresentation: AnyObject {
    func onViewDidLoad()
}

protocol PersonListSceneDelegate: AnyObject {
    func openPersonDetails(_ person: Person)
}
