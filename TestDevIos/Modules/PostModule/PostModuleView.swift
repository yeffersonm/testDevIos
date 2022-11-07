//
//  PostModuleView.swift
//  TestDevIos
//
//  Created by MacBooK Pro on 5/11/22.
//  
//

import Foundation
import UIKit

class PostModuleView: BaseViewController {
    
    @IBOutlet private weak var secondView: UIView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var subtitleLabel: UILabel!
    @IBOutlet weak var closeBtn: UIButton!
    
    // MARK: Properties
    var presenter: PostModulePresenterProtocol?
    var post: data?
    
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    @IBAction func closeAction(_ sender: UIButton) {
        dismiss(animated: true)
    }
        
    private func setupView(){
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        titleLabel.text = post?.title
        subtitleLabel.text = post?.body
        closeBtn.tintColor = .red
        secondView.applyBorder(color: .black, width: 2)
        secondView.applyCircleWithRadius(radius: 15)
    }
}

extension PostModuleView: PostModuleViewProtocol {
    
}
