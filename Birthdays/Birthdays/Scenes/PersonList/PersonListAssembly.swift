//
//  PersonListAssembly.swift
//  Birthdays
//
//  Created by Vadym Brusko on 15.07.2022.
//  
//

import UIKit

struct PersonListAssembly {
    private let delegate: PersonListSceneDelegate
    
    init(delegate: PersonListSceneDelegate) {
        self.delegate = delegate
    }

    func makeScene() -> UIViewController {
        let presenter = PersonListPresenter()
        presenter.delegate = delegate
        let viewController = PersonListViewController()
        viewController.presenter = presenter
        presenter.view = viewController
        return viewController
    }
}
