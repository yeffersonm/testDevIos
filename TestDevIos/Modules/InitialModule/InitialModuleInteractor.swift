//
//  InitialModuleInteractor.swift
//  TestDevIos
//
//  Created by MacBooK Pro on 4/11/22.
//  
//

import Foundation

class InitialModuleInteractor: InitialModuleInteractorInputProtocol {
    // MARK: Properties
    weak var presenter: InitialModuleInteractorOutputProtocol?
    
    
    func fetchPosts() {
        Service.shared.requestForPosts { [weak self] result in
            switch result {
            case .success(let model):
                DispatchQueue.main.async {
                    self?.presenter?.fillArray(model: model.data)
                }
            case .failure(let error):
                self?.presenter?.requestError(error: error.localizedDescription)
            }
        }
    }
    
    func filterString(char: String, array: [data]) {
        let structArray = array.filter { $0.title.localizedCaseInsensitiveContains(char)}
        self.presenter?.verifyData(char: char, data: structArray)
    }
    
}
