//
//  BaseAlertView.swift
//  TestDevIos
//
//  Created by MacBooK Pro on 23/09/22.
//

import UIKit

enum BaseAlertType {
    case error
    case noResult
    case network
    
    var path: String {
        switch self {
        case .error:
            return "Error interno por favor intente mas tarde."
        case .noResult:
            return "Uph\n\nNo encontramos resultados"
        case .network:
            return "No detectamos conexion a internet por favor verifique su conexion"
        }
    }
    
    var image: UIImage? {
        switch self {
        case .error:
            return UIImage(named: "internalError")
        case .noResult:
            return UIImage(named: "noResult")
        case .network:
            return UIImage(named: "networkConnection")
        }
    }
}

class BaseAlertView: InternView {
    
    @IBOutlet private weak var imageAlert: UIImageView!
    @IBOutlet private weak var labelAlert: UILabel!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public init(alertType: BaseAlertType) {
        super.init()
        setupAlert(alertType: alertType)
    }
    
    required public init() {
        fatalError("init() has not been implemented")
    }
    
    private func setupAlert(alertType: BaseAlertType) {
        imageAlert.image = alertType.image
        labelAlert.text = alertType.path
    }
    
    public func remove() {
        self.removeFromSuperview()
    }
}
