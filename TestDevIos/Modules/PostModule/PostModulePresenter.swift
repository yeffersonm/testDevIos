//
//  PostModulePresenter.swift
//  TestDevIos
//
//  Created by MacBooK Pro on 5/11/22.
//  
//

import Foundation

class PostModulePresenter  {
    
    // MARK: Properties
    weak var view: PostModuleViewProtocol?
    var interactor: PostModuleInteractorInputProtocol?
    var wireFrame: PostModuleWireFrameProtocol?
    
}

extension PostModulePresenter: PostModulePresenterProtocol {
    func viewDidLoad() {
    }
}

extension PostModulePresenter: PostModuleInteractorOutputProtocol {
}
