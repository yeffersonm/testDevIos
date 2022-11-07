//
//  BaseView-loader.swift
//  TestDevIos
//
//  Created by MacBooK Pro on 23/09/22.
//

import UIKit
import SwiftLoader


protocol BaseLoadingViewProtocol: AnyObject {
    func showLoader()
    func hideLoader()
    func removeBaseAlert()
}

extension BaseViewController: BaseLoadingViewProtocol {

    func showLoader() {
        view.addSubview(loader)
        loader.translatesAutoresizingMaskIntoConstraints = false
        loader.equalBoundsTo(view: view)
        DispatchQueue.main.asyncAfter(deadline: .now()) { [] in
            UIView.animate(withDuration: 0.2, animations: {
                SwiftLoader.show(title: "Loading...", animated: true)
            })
        }
    }
    
    func hideLoader() {
        SwiftLoader.hide()
    }
}
