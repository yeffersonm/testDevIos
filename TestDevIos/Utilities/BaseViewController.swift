//
//  BaseViewController.swift
//  TestDevIos
//
//  Created by MacBooK Pro on 23/09/22.
//

import UIKit
import SwiftLoader
import Network

class BaseViewController: UIViewController, Storyboarded {
    var loader = SwiftLoader()
    let monitor = NWPathMonitor()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLoader()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let queue = DispatchQueue(label: "monitor")
        monitor.start(queue: queue)
        monitor.pathUpdateHandler = { path in
            if path.status == .unsatisfied {
                DispatchQueue.main.async { [] in
                    self.addBaseAlert(type: .network)
                }
            }
        }
    }
    
    override func viewWillDisappear(_ animated: Bool)  {
        super.viewWillDisappear(animated)
        monitor.cancel()
    }
    
    func removeBaseAlert() {
        guard let alertView = view.subviews.first(where: { $0 is BaseAlertView }) as? BaseAlertView else {
            return
        }
        
        alertView.remove()
    }
    
    func setupLoader(){
        var config : SwiftLoader.Config = SwiftLoader.Config()
        config.size = 100
        config.spinnerColor = .black
        config.foregroundColor = .black
        config.foregroundAlpha = 0.5
        SwiftLoader.setConfig(config)
    }
    
    func addBaseAlert(type: BaseAlertType) {
        guard view.subviews.filter({ $0 is BaseAlertView }).isEmpty else {
            return
        }
        
        let baseAlertViewController = BaseAlertView(alertType: type)
        view.addSubview(baseAlertViewController)
        baseAlertViewController.equalBoundsTo(view: view)
        self.hideLoader()
    }
}
