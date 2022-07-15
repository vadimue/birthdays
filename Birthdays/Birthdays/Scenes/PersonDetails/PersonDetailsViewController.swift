//
//  PersonDetailsViewController.swift
//  Birthdays
//
//  Created by Vadym Brusko on 15.07.2022.
//  
//

import UIKit

final class PersonDetailsViewController: UIViewController, ViewControllerViewUnwrappable {
    lazy var customView: PersonDetailsView = forciblyUnwrappedView()
    var presenter: PersonDetailsPresentation!
    
    override func loadView() {
        view = PersonDetailsView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.onViewDidLoad()
        customView.goBackButton.addAction(UIAction(handler: { [weak self] _ in
            self?.presenter?.onGoBackTap()
        }), for: .touchUpInside)
    }
}

// MARK: -PersonDetailsView Protocol
extension PersonDetailsViewController: PersonDetailsViewInterface {
    func configure(from person: Person) {
        customView.configure(from: person)
    }
}
