//
//  PersonListPresenter.swift
//  Birthdays
//
//  Created by Vadym Brusko on 15.07.2022.
//  
//

import Foundation

final class PersonListPresenter {
    weak var view: PersonListViewInterface?
    weak var delegate: PersonListSceneDelegate?
    lazy var tableViewProvider: PersonListProvider = {
        let tableViewProvider = PersonListProvider()
        tableViewProvider.delegate = self
        return tableViewProvider
    }()
    
    private let personListService: PersonListServiceProtocol
    
    init(personListService: PersonListServiceProtocol = PersonListService()) {
        self.personListService = personListService
    }
}

// MARK: - PersonListPresentation Protocol
extension PersonListPresenter: PersonListPresentation {
    func onViewDidLoad() {
        view?.setProvider(tableViewProvider)
        view?.showLoadingView()
        personListService.fetchPersons { [weak self] result in
            self?.handlePersonListResponse(result)
        }
    }
}

extension PersonListPresenter: PersonListProviderDelegate {
    func didSelectCell(_ person: Person) {
        delegate?.openPersonDetails(person)
    }
}

private extension PersonListPresenter {
    func handlePersonListResponse(_ result: Result<PersonList, Error>) {
        view?.hideLoadingView()
        switch result {
        case let .success(list):
            tableViewProvider.data = list.results
            view?.reloadData()
        case let .failure(error):
            // TODO: handle error
            print(error)
            return
        }
    }
}
