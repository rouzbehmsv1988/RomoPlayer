//
//  HomeRouter.swift
//  RomoPlayer
//
//  Created by rouzbeh on 21.08.23.
//

import Foundation
import UIKit

protocol HomeRouterProtocol: AnyObject {
    static func createModule() -> UIViewController
}

class HomeRouter: HomeRouterProtocol {
    static func createModule() -> UIViewController {
        let view = HomeViewController()
        let interactor = HomeInteractor()
        let presenter = HomePresenter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        let navigationController = UINavigationController(rootViewController: view)
        return navigationController
    }
}
