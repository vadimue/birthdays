//
//  PersonDetailsView.swift
//  Birthdays
//
//  Created by Vadym Brusko on 15.07.2022.
//  
//

import UIKit

final class PersonDetailsView: UIView {
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.alignment = .center
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(top: 67, left: 18, bottom: 109, right: 18)
        return stackView
    }()
    
    private let initialsContainer: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 50
        view.clipsToBounds = true
        view.backgroundColor = .lightGray
        return view
    }()
    
    private let initialsLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 50, weight: .bold)
        return label
    }()

    private let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 32, weight: .semibold)
        return label
    }()

    private let ageLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = .systemFont(ofSize: 16, weight: .regular)
        return label
    }()
    
    let goBackButton: UIButton = {
        var config = UIButton.Configuration.filled()
        var title = AttributedString("GO BACK")
        title.font = .systemFont(ofSize: 12, weight: .bold)
        config.attributedTitle = title
        config.baseBackgroundColor = .black
        config.baseForegroundColor = .white
        config.cornerStyle = .medium
        return UIButton(configuration: config)
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupLayout() {
        backgroundColor = .white
        addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
        }
        stackView.addArrangedSubview(initialsContainer)
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(ageLabel)
        stackView.setCustomSpacing(70, after: initialsContainer)
        initialsContainer.snp.makeConstraints { make in
            make.size.equalTo(100)
        }
        initialsContainer.addSubview(initialsLabel)
        initialsLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        addSubview(goBackButton)
        goBackButton.snp.makeConstraints { make in
            make.top.equalTo(stackView.snp.bottom)
            make.height.equalTo(35)
            make.leading.trailing.equalToSuperview().inset(16)
        }
    }
    
    func configure(from model: Person) {
        initialsLabel.text = model.name.initials
        nameLabel.text = model.name.full
        ageLabel.text = String(model.dob.age) + " years old"
    }
}
