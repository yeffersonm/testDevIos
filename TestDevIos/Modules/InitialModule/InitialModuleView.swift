//
//  InitialModuleView.swift
//  TestDevIos
//
//  Created by MacBooK Pro on 4/11/22.
//  
//

import Foundation
import UIKit
import SwiftLoader

class InitialModuleView: BaseViewController {
    
    @IBOutlet private weak var searchBar: UISearchBar!
    @IBOutlet private weak var mainTableView: UITableView!
    
    // MARK: Properties
    var presenter: InitialModulePresenterProtocol?
    var listPosts = [data]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showLoader()
        presenter?.viewDidLoad()
        setupView()
    }
    
    private func setupView(){
        self.mainTableView.register(postTableViewCell
            .nib, forCellReuseIdentifier: postTableViewCell.identifier)
    }
}

extension InitialModuleView: InitialModuleViewProtocol {
    
    func fillData(dataTable: [data]) {
        listPosts = dataTable
        mainTableView.reloadData()
        hideLoader()
    }
    
    func showNoResultView() {
        addBaseAlert(type: .noResult)
    }
    
}

extension InitialModuleView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        listPosts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: postTableViewCell.identifier, for: indexPath) as? postTableViewCell else { fatalError("xib doesn't exist") }
        cell.setupCell(with: listPosts[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.presentPostController(data: listPosts[indexPath.row])
    }
}

extension InitialModuleView: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.showLoader()
        presenter?.searchString(char: searchText, data: listPosts)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar)
    {
        searchBar.endEditing(true)
    }
}
