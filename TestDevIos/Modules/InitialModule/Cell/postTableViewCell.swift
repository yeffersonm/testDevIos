//
//  postTableViewCell.swift
//  TestDevIos
//
//  Created by MacBooK Pro on 4/11/22.
//

import UIKit

class postTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var contenLabel: UILabel!
    
    class var identifier: String { return String(describing: self) }
    class var nib: UINib { return UINib(nibName: identifier, bundle: nil) }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }
    
    func setupCell(with model: data) {
        titleLabel.text = model.title
        contenLabel.text = model.body
    }
}
