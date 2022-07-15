//
//  PersonDetailsAssembly.swift
//  Birthdays
//
//  Created by Vadym Brusko on 15.07.2022.
//  
//

import UIKit

struct PersonDetailsAssembly {
    private let delegate: PersonDetailsSceneDelegate
    private let input: PersonSceneInput
    
    init(delegate: PersonDetailsSceneDelegate, input: PersonSceneInput) {
        self.delegate = delegate
        self.input = input
    }

    func makeScene() -> UIViewController {
        let presenter = PersonDetailsPresenter(input: input)
        presenter.delegate = delegate
        let viewController = PersonDetailsViewController()
        viewController.presenter = presenter
        presenter.view = viewController
        return viewController
    }
}
