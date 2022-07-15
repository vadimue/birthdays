//
//  ViewControllerViewUnwrappable.swift
//  Birthdays
//
//  Created by Vadym Brusko on 15.07.2022.
//

import UIKit

protocol ViewControllerViewUnwrappable {
    /// Returns view of given UIView subclass if
    /// view corresponds to subclass T, otherwise
    /// fatalError occurs.
    func forciblyUnwrappedView<T: UIView>() -> T
}

extension ViewControllerViewUnwrappable where Self: UIViewController {
    func forciblyUnwrappedView<T: UIView>() -> T {
        guard let customView = view as? T else {
            fatalError("View must exist and correspond to subclass T")
        }
        return customView
    }
}

