//
//  PersonListProviderMock.swift
//  BirthdaysTests
//
//  Created by Vadym Brusko on 15.07.2022.
//

import Foundation
@testable import Birthdays

class PersonListViewInterfaceMock: PersonListViewInterface {
    
    var setProviderWasCalled = false
    func setProvider(_ provider: TableViewProvider) {
        setProviderWasCalled = true
    }
    
    var reloadWasCalled = false
    func reloadData() {
        reloadWasCalled = true
    }
    
    var showLoadingViewWasCalled = false
    func showLoadingView() {
        showLoadingViewWasCalled = true
    }
    
    var hideLoadingViewWasCalled = false
    func hideLoadingView() {
        hideLoadingViewWasCalled = true
    }
}

class PersonListSceneDelegateMock: PersonListSceneDelegate {
    
    var openPersonDetailsWasCalled = false
    func openPersonDetails(_ person: Person) {
        openPersonDetailsWasCalled = true
    }
}

class PersonListServiceProtocolMock: PersonListServiceProtocol {
    
    var mockPersons: Result<PersonList, Error>? = nil
    var fetchPersonsWasCalled = false
    func fetchPersons(completionHandler: @escaping ((Result<PersonList, Error>) -> Void)) {
        if let mockPersons = mockPersons {
            completionHandler(mockPersons)
        }
        fetchPersonsWasCalled = true
    }
}

extension Person {
    static let testPerson1 = Person(name: Name(title: "", first: "", last: ""), dob: Dob(date: Date(), age: 0))
    static let testPerson2 = Person(name: Name(title: "1", first: "1", last: "1"), dob: Dob(date: Date(), age: 1))
}
