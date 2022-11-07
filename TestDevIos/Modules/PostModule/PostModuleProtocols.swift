//
//  PostModuleProtocols.swift
//  TestDevIos
//
//  Created by MacBooK Pro on 5/11/22.
//  
//

import Foundation
import UIKit

protocol PostModuleViewProtocol: AnyObject {
    // PRESENTER -> VIEW
    var presenter: PostModulePresenterProtocol? { get set }
}

protocol PostModuleWireFrameProtocol: AnyObject {
    // PRESENTER -> WIREFRAME
    static func createPostModuleModule(post: data) -> PostModuleView
}

protocol PostModulePresenterProtocol: AnyObject {
    // VIEW -> PRESENTER
    var view: PostModuleViewProtocol? { get set }
    var interactor: PostModuleInteractorInputProtocol? { get set }
    var wireFrame: PostModuleWireFrameProtocol? { get set }
    
    func viewDidLoad()
}

protocol PostModuleInteractorOutputProtocol: AnyObject {
// INTERACTOR -> PRESENTER
}

protocol PostModuleInteractorInputProtocol: AnyObject {
    // PRESENTER -> INTERACTOR
    var presenter: PostModuleInteractorOutputProtocol? { get set }
}

