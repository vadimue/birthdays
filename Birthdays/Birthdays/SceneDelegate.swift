//
//  SceneDelegate.swift
//  Birthdays
//
//  Created by Vadym Brusko on 15.07.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow? {
        didSet {
            appDelegate.window = window
        }
    }
    private var appDelegate: AppDelegate {
        guard let object = UIApplication.shared.delegate as? AppDelegate else {
            fatalError("Can't get an access to AppDelegate")
        }
        return object
    }

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = scene as? UIWindowScene else {
            return
        }
        let windowObject = UIWindow(windowScene: windowScene)
        window = windowObject

        let viewController = PersonListAssembly(delegate: self).makeScene()
        let navigationController = UINavigationController()
        navigationController.setViewControllers([viewController], animated: false)
        window?.rootViewController = navigationController
    }
}

extension SceneDelegate: PersonListSceneDelegate {
    func openPersonDetails(_ person: Person) {
        //let viewController = PersonDetailsAssembly(delegate: self).makeScene()
        //window?.rootViewController?.present(viewController, animated: true, completion: nil)
    }
}
