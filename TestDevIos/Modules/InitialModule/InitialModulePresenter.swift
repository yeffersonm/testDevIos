//
//  InitialModulePresenter.swift
//  TestDevIos
//
//  Created by MacBooK Pro on 4/11/22.
//  
//

import Foundation

class InitialModulePresenter  {
    // MARK: Properties
    weak var view: InitialModuleViewProtocol?
    var interactor: InitialModuleInteractorInputProtocol?
    var wireFrame: InitialModuleWireFrameProtocol?
    private var initialData = [data]()
}

extension InitialModulePresenter: InitialModulePresenterProtocol {
    
    func viewDidLoad() {
        interactor?.fetchPosts()
    }
    
    func searchString(char: String, data: [data]) {
        interactor?.filterString(char: char, array: data)
    }
    
    func presentPostController(data: data) {
        if let newView = view {
            wireFrame?.showPostModule(post: data, from: newView)
        }
    }
}

extension InitialModulePresenter: InitialModuleInteractorOutputProtocol {
    
    func fillArray(model: [data]) {
        initialData = model
        view?.fillData(dataTable: model)
    }
    
    func verifyData(char: String, data: [data]) {
        if char.count > 0 && data.count > 0 {
            view?.fillData(dataTable: data)
        }else{
            view?.fillData(dataTable: initialData)
        }
    }
    
    func requestError(error: String) {
        view?.showNoResultView()
        wireFrame?.showErrorAlert("ERROR", text: error)
    }
}
