//
//  ViewController.swift
//  MiniCVApp-Serf
//
//  Created by Dmitry Dorodniy on 01.08.2023.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    var tags: [String] = ["MVI/MVVM", "Kotlin Coroutines", "Room", "OkHttp", "DataStore", "WorkManager", "custom view", "DataStore", "ООП и SOLID" ]
    
    // MARK: - UI Elements
    
    private lazy var profileLabel: UILabel = {
        let label = UILabel()
        label.text = "Профиль"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var bioStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 8
        //        stackView.distribution = .equalSpacing
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var iconView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "icon")
        imageView.layer.cornerRadius = 60
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Дородний Дмитрий Александрович"
        label.numberOfLines = 2
        
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var descrioptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Middle iOS-разработчик, опыт более 2-х лет"
        label.numberOfLines = 1
        label.textAlignment = .center
        //        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .systemGray
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var cityLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.text = "Таганрог"
        label.textColor = .systemGray
        label.numberOfLines = 1
        
        return label
    }()
    
    private lazy var skilsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        //        stackView.spacing = 8
        //        stackView.distribution = .equalSpacing
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var mySkillsLabel: UILabel = {
        let label = UILabel()
        label.text = "Мои навыки"
        
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var editImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "pencil")
        return imageView
    }()
    
    private lazy var tagsCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.backgroundColor = .clear
        collectionView.register(TagCollectionViewCell.self, forCellWithReuseIdentifier: TagCollectionViewCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }()
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupHierarchy()
        setupLayuot()
    }
    
    // MARK: - Setups
    private func setupView() {
        view.backgroundColor = .systemGray5
    }
    
    private func setupHierarchy() {
        view.addSubview(profileLabel)
        view.addSubview(bioStackView)
        view.addSubview(skilsStackView)
        
        bioStackView.addArrangedSubview(iconView)
        bioStackView.addArrangedSubview(nameLabel)
        bioStackView.addArrangedSubview(descrioptionLabel)
        bioStackView.setCustomSpacing(3, after: descrioptionLabel)
        bioStackView.addArrangedSubview(cityLabel)
        
        skilsStackView.addArrangedSubview(mySkillsLabel)
        skilsStackView.addArrangedSubview(editImageView)
    }
    
    private func setupLayuot() {
        NSLayoutConstraint.activate([
            profileLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 18),
            profileLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            bioStackView.topAnchor.constraint(equalTo: profileLabel.bottomAnchor, constant: 42),
            bioStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 51),
            bioStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -51),
            bioStackView.heightAnchor.constraint(equalToConstant: 244),
            
            iconView.heightAnchor.constraint(equalToConstant: 120),
            iconView.widthAnchor.constraint(equalToConstant: 120),
            
            skilsStackView.topAnchor.constraint(equalTo: bioStackView.bottomAnchor, constant: 40),
            skilsStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            skilsStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
        ])
    }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tags.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        return UICollectionViewCell()
    }
}

