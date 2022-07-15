//
//  PersonTableViewCell.swift
//  Birthdays
//
//  Created by Vadym Brusko on 15.07.2022.
//

import UIKit
import SnapKit

final class PersonTableViewCell: UITableViewCell {

    private let initialsContainer: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 19
        view.clipsToBounds = true
        view.backgroundColor = .lightGray
        return view
    }()
    
    private let initialsLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 14, weight: .bold)
        return label
    }()

    private let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 12, weight: .semibold)
        return label
    }()

    private let dateOfBirthLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = .systemFont(ofSize: 12, weight: .regular)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        contentView.addSubview(initialsContainer)
        initialsContainer.snp.makeConstraints { make in
            make.size.equalTo(38).priority(.high)
            make.leading.top.bottom.equalToSuperview().inset(14)
        }
        initialsContainer.addSubview(initialsLabel)
        initialsLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        contentView.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { make in
            make.leading.equalTo(initialsContainer.snp.trailing).offset(12)
            make.top.equalTo(initialsContainer.snp.top)
            make.trailing.equalToSuperview().inset(14)
        }
        contentView.addSubview(dateOfBirthLabel)
        dateOfBirthLabel.snp.makeConstraints { make in
            make.leading.equalTo(nameLabel.snp.leading)
            make.trailing.equalToSuperview().inset(14)
            make.bottom.equalTo(initialsContainer.snp.bottom)
        }
    }

    func configure(from model: Person) {
        initialsLabel.text = model.name.initials
        nameLabel.text = model.name.full
        dateOfBirthLabel.text = model.dob.dateString
    }
}
