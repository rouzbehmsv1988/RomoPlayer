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
    func fetchItems(_ text: String?)
    
}




class HomePresenter: HomePresenterProtocol, DataBindingDelegation, searchDelegate {
    var workItem: DispatchWorkItem?
    func searchForText(_ text: String?) {
        workItem?.cancel()
        let task  =  DispatchWorkItem { [weak self] in
            self?.interactor?.fetchItems(text)
        }
        workItem = task
        DispatchQueue.global(qos: .userInteractive).asyncAfter(deadline: .now() + 1.0, execute: task)
       
    }
    
    func didSelect(_ data: CellDataConformable) {
        
    }
    
    var dataBinder: HomeDataBinder?
    weak var view: HomeViewProtocol?
    var interactor: HomeInteractorInputProtocol?
    init() {
        self.dataBinder = HomeDataBinder()
        dataBinder?.delegate = self
        dataBinder?.searchDelegate = self
    }
    func fetchData() {
   
    }
    
    func itemsFetched(_ items: [SongItem]) {
        view?.displayData(items)
    }
}
