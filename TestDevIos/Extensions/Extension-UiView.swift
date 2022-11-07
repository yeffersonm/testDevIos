//
//  Extension-UiView.swift
//  TestDevIos
//
//  Created by MacBooK Pro on 23/09/22.
//
import UIKit

extension UIView {
    class var viewID: String {
        return "\(self)"
    }
    
    func equalBoundsTo(view: UIView) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        self.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        self.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        self.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    func applyBorder(color:UIColor, width:CGFloat) {
        self.layer.borderColor = color.cgColor
        self.layer.borderWidth = width
    }
    
    func applyCircleWithRadius(radius:CGFloat) {
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
    }
}

