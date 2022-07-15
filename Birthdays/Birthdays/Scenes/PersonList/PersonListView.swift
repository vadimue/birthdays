//
//  PersonListView.swift
//  Birthdays
//
//  Created by Vadym Brusko on 15.07.2022.
//  
//

import UIKit

final class PersonListView: UIView {
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(PersonTableViewCell.self, forCellReuseIdentifier: "PersonTableViewCell")
        return tableView
    }()
    
    private lazy var activityIndicator: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView(style: .medium)
        view.startAnimating()
        view.hidesWhenStopped = true
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func showLoadingView() {
        tableView.backgroundView = activityIndicator
    }
    
    func hideLoadingView() {
        tableView.backgroundView = nil
    }
}
