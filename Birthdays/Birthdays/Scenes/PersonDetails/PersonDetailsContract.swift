//
//  PersonDetailsContract.swift
//  Birthdays
//
//  Created by Vadym Brusko on 15.07.2022.
//  
//

protocol PersonDetailsViewInterface: AnyObject {
    func configure(from person: Person)
}

protocol PersonDetailsPresentation: AnyObject {
    func onViewDidLoad()
    func onGoBackTap()
}

protocol PersonDetailsSceneDelegate: AnyObject {
    func close()
}

struct PersonSceneInput {
    let person: Person
}
