//
//  ProfileCell.swift
//  MiniCVApp-Serf
//
//  Created by Dmitry Dorodniy on 02.10.2023.
//

import UIKit

class ProfileCell: UICollectionViewCell {
    
    static let identifier = "ProfileCell"
    
    private lazy var iconView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "icon")
        imageView.layer.cornerRadius = 75
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Дородний Дмитрий Александрович"
        label.numberOfLines = 2
        
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        return label
    }()
    
    private lazy var descriptionStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.spacing = 12
        return stackView
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Middle iOS-разработчик, опыт более 2-х лет"
        label.numberOfLines = 1
        label.textAlignment = .center
        //        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .systemGray
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    private lazy var cityLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.text = "Таганрог"
        label.textAlignment = .center
        label.textColor = .systemGray
        label.numberOfLines = 1
        
        return label
    }()
    
    func configure(with model: ItemList) {
       
    }
    
    // MARK: - Lyfecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setups
    private func setupHierarchy() {
        descriptionStackView.addArrangedSubview(descriptionLabel)
        descriptionStackView.addArrangedSubview(cityLabel)
        contentView.addSubViewsForAutoLayout([iconView,
                                              nameLabel,
                                              descriptionStackView])
    }
    
    private func setupLayout() {
        
        NSLayoutConstraint.activate([
            iconView.topAnchor.constraint(equalTo: topAnchor),
            iconView.centerXAnchor.constraint(equalTo: centerXAnchor),
            iconView.widthAnchor.constraint(equalToConstant: 150),
            iconView.heightAnchor.constraint(equalToConstant: 150),
            
            nameLabel.topAnchor.constraint(equalTo: iconView.bottomAnchor, constant: 16),
            nameLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            nameLabel.heightAnchor.constraint(equalToConstant: 64),
            
            descriptionStackView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor),
            descriptionStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            descriptionStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            descriptionStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
            
            
        ])
    }
}
