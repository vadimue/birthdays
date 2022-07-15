//
//  PersonListPresenterTests.swift
//  BirthdaysTests
//
//  Created by Vadym Brusko on 15.07.2022.
//

import XCTest
@testable import Birthdays

class PersonListPresenterTests: XCTestCase {

    private var presenter: PersonListPresenter!
    private var delegate: PersonListSceneDelegateMock!
    private var view: PersonListViewInterfaceMock!
    private var service: PersonListServiceProtocolMock!

    override func setUp() {
        delegate = PersonListSceneDelegateMock()
        view = PersonListViewInterfaceMock()
        service = PersonListServiceProtocolMock()
        presenter = PersonListPresenter(personListService: service)
        presenter.delegate = delegate
        presenter.view = view
    }

    override func tearDown() {
        delegate = nil
        view = nil
        service = nil
        presenter = nil
    }

    func test_onViewDidLoad_shouldSetProvider() {
        // given
        
        // when
        presenter.onViewDidLoad()
        // then
        XCTAssert(view.setProviderWasCalled)
    }

    func test_onViewDidLoad_shouldShowLoading() {
        // given
        
        // when
        presenter.onViewDidLoad()
        // then
        XCTAssert(view.showLoadingViewWasCalled)
    }
    
    func test_onViewDidLoad_shouldStartFetchingPersons() {
        // given
        
        // when
        presenter.onViewDidLoad()
        // then
        XCTAssert(service.fetchPersonsWasCalled)
    }
    
    func test_didSelectcell_delegateShouldOpenPersonDetails() {
        // given
        let person = Person.testPerson1
        // when
        presenter.didSelectCell(person)
        // then
        XCTAssert(delegate.openPersonDetailsWasCalled)
    }
    
    func test_onViewDidLoad_failureFetch_doNothing() {
        // given
        service.mockPersons = .failure(NetworkError.somethingWentWrong)
        // when
        presenter.onViewDidLoad()
        // then
        XCTAssertFalse(view.reloadWasCalled)
    }
    
    func test_onViewDidLoad_successFetch_reloadTableView() {
        // given
        service.mockPersons = .success(PersonList(results: [Person.testPerson1, Person.testPerson2]))
        // when
        presenter.onViewDidLoad()
        // then
        XCTAssert(view.reloadWasCalled)
    }
}
