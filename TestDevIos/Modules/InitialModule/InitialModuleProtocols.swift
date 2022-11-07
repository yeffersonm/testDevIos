//
//  InitialModuleProtocols.swift
//  TestDevIos
//
//  Created by MacBooK Pro on 4/11/22.
//  
//

import Foundation
import UIKit

protocol InitialModuleViewProtocol: AnyObject {
    // PRESENTER -> VIEW
    var presenter: InitialModulePresenterProtocol? { get set }
    func fillData(dataTable: [data])
    func showNoResultView()
}

protocol InitialModuleWireFrameProtocol: AnyObject {
    // PRESENTER -> WIREFRAME
    var viewController: UIViewController? { get set }
    static func createInitialModuleModule() -> InitialModuleView
    func showPostModule(post:data, from:InitialModuleViewProtocol)
    func showErrorAlert(_ title: String, text: String)
}

protocol InitialModulePresenterProtocol: AnyObject {
    // VIEW -> PRESENTER
    var view: InitialModuleViewProtocol? { get set }
    var interactor: InitialModuleInteractorInputProtocol? { get set }
    var wireFrame: InitialModuleWireFrameProtocol? { get set }
    
    func viewDidLoad()
    func searchString(char:String, data: [data])
    func presentPostController(data: data)
}

protocol InitialModuleInteractorOutputProtocol: AnyObject {
    // INTERACTOR -> PRESENTER
    func fillArray(model: [data])
    func requestError(error:String)
    func verifyData(char:String, data:[data])
}

protocol InitialModuleInteractorInputProtocol: AnyObject {
    // PRESENTER -> INTERACTOR
    var presenter: InitialModuleInteractorOutputProtocol? { get set }
    func fetchPosts()
    func filterString(char:String, array:[data])
}
