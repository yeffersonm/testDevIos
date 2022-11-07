//
//  InitialModuleWireFrame.swift
//  TestDevIos
//
//  Created by MacBooK Pro on 4/11/22.
//  
//

import Foundation
import UIKit

class InitialModuleWireFrame: InitialModuleWireFrameProtocol {
    var viewController: UIViewController?
    
    static func createInitialModuleModule() -> InitialModuleView {
        let ref = InitialModuleView.instantiateStoryBoard(from: .initialModule)
        let presenter: InitialModulePresenterProtocol & InitialModuleInteractorOutputProtocol = InitialModulePresenter()
        let interactor: InitialModuleInteractorInputProtocol  = InitialModuleInteractor()
        let wireFrame: InitialModuleWireFrameProtocol = InitialModuleWireFrame()
        ref.presenter = presenter
        wireFrame.viewController = ref
        presenter.view = ref
        presenter.wireFrame = wireFrame
        presenter.interactor = interactor
        interactor.presenter = presenter
        return ref
    }
    
    func showPostModule(post: data, from: InitialModuleViewProtocol) {
        let postController = PostModuleWireFrame.createPostModuleModule(post: post)
        postController.modalPresentationStyle = .overFullScreen
        postController.modalTransitionStyle = .coverVertical
        self.viewController?.present(postController, animated: true)
    }
    
    func showErrorAlert(_ title: String, text: String) {
        let alert = UIAlertController(title: title, message: text, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.destructive, handler: nil))
        self.viewController?.present(alert, animated: true, completion: nil)
    }
}
