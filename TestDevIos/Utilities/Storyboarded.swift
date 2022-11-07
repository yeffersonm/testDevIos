//
//  Storyboarded.swift
//  TestDevIos
//
//  Created by MacBooK Pro on 23/09/22.
//

import UIKit

enum Storyboards: String {
    case initialModule = "InitialModule"
    case postModule = "PostModule"
}

protocol Storyboarded {
    static func instantiateStoryBoard(from storyboard: Storyboards) -> Self
}

extension Storyboarded where Self: UIViewController {
    static func instantiateStoryBoard(from storyboard: Storyboards) -> Self {
        let fullName = NSStringFromClass(self)
        let className = fullName.components(separatedBy: ".")[1]
        let storyboard = UIStoryboard(name: storyboard.rawValue, bundle: Bundle.main)
        return storyboard.instantiateViewController(withIdentifier: className) as! Self
    }
}
