//
//  PostModuleWireFrame.swift
//  TestDevIos
//
//  Created by MacBooK Pro on 5/11/22.
//  
//

import Foundation
import UIKit

class PostModuleWireFrame: PostModuleWireFrameProtocol {

    class func createPostModuleModule(post: data) -> PostModuleView {
        let ref = PostModuleView.instantiateStoryBoard(from: .postModule)
            let presenter: PostModulePresenterProtocol & PostModuleInteractorOutputProtocol = PostModulePresenter()
            let interactor: PostModuleInteractorInputProtocol = PostModuleInteractor()
            let wireFrame: PostModuleWireFrameProtocol = PostModuleWireFrame()
            ref.presenter = presenter
            ref.post = post
            presenter.view = ref
            presenter.wireFrame = wireFrame
            presenter.interactor = interactor
            interactor.presenter = presenter
        return ref
    }
    
}
