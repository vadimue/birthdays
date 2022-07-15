//
//  PersonDetailsPresenter.swift
//  Birthdays
//
//  Created by Vadym Brusko on 15.07.2022.
//  
//

import Foundation

final class PersonDetailsPresenter {
    weak var view: PersonDetailsViewInterface?
    weak var delegate: PersonDetailsSceneDelegate?
    
    private let person: Person
    
    init(input: PersonSceneInput) {
        self.person = input.person
    }
}

// MARK: - PersonDetailsPresentation Protocol
extension PersonDetailsPresenter: PersonDetailsPresentation {
    func onViewDidLoad() {
        view?.configure(from: person)
    }
    
    func onGoBackTap() {
        delegate?.close()
    }
}
