//
//  HomePresenter.swift
//  RomoPlayer
//
//  Created by rouzbeh on 21.08.23.
//

import Foundation


protocol HomePresenterProtocol: AnyObject {
    var view: HomeViewProtocol? { get set }
    var interactor: HomeInteractorInputProtocol? { get set }
    func fetchData()
    func itemsFetched(_ items: [SongItem])
    var dataBinder: HomeDataBinder? { get set }
}


protocol HomeInteractorInputProtocol: AnyObject {
    var presenter: HomePresenterProtocol? { get set }
    func fetchItems()
}




class HomePresenter: HomePresenterProtocol, DataBindingDelegation {
    func didSelect(_ data: CellDataConformable) {
        
    }
    
    var dataBinder: HomeDataBinder?
    weak var view: HomeViewProtocol?
    var interactor: HomeInteractorInputProtocol?
    init() {
        self.dataBinder = HomeDataBinder()
        dataBinder?.delegate = self
    }
    func fetchData() {
        interactor?.fetchItems()
    }
    
    func itemsFetched(_ items: [SongItem]) {
        view?.displayData(items)
    }
}
