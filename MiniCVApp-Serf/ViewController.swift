//
//  ViewController.swift
//  MiniCVApp-Serf
//
//  Created by Dmitry Dorodniy on 01.08.2023.
//

import UIKit

class ViewController: UIViewController {
    
    var isEdit = false {
        didSet {
            editButton.setNeedsUpdateConfiguration()
        }
    }
    
    var tags = [Tag]()
    
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
    
//    private lazy var editImageView: UIImageView = {
//        let imageView = UIImageView()
//        imageView.image = UIImage(named: "pencil")
//        return imageView
//    }()
    
    private lazy var editButton: UIButton = {
        var configuration = UIButton.Configuration.plain()
        configuration.baseForegroundColor = .black
        let handler: UIButton.ConfigurationUpdateHandler = { button in
            button.configuration?.image = self.isEdit ? UIImage(systemName: "checkmark.circle") : UIImage(named: "pencil")
            }
        
        let button = UIButton(configuration: configuration)
        button.configurationUpdateHandler = handler

        button.addTarget(self, action: #selector(didEditButtonPress), for: .touchUpInside)
        return button
    }()
    
    private lazy var tagsCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: createCollectionLayout())
        collectionView.backgroundColor = .systemBackground
        collectionView.register(TagCollectionViewCell.self, forCellWithReuseIdentifier: TagCollectionViewCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    private func createCollectionLayout() -> UICollectionViewLayout {
        let spacing: CGFloat = 12
        let itemSize = NSCollectionLayoutSize(widthDimension: .estimated(57),
                                              heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(44))

        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        group.interItemSpacing = .fixed(spacing)
        group.edgeSpacing = .init(leading: .none, top: .fixed(10), trailing: .none, bottom: .none)
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = .init(top: spacing, leading: spacing + 4,
                                      bottom: spacing, trailing: spacing + 4)
      
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
    
    // MARK: - Actions
    
    @objc private func didEditButtonPress() {
        if !isEdit {
            tags.append(Tag(skill: "+"))
        } else {
            tags.removeLast()
        }
        
        tagsCollectionView.reloadData()
        isEdit.toggle()
    }
    
    
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
        dismissKeyboard()
        tags = Tag.getData
    }
    
    private func setupHierarchy() {
        view.addSubview(profileLabel)
        view.addSubview(bioStackView)
        view.addSubview(skilsStackView)
        view.addSubview(tagsCollectionView)
        
        bioStackView.addArrangedSubview(iconView)
        bioStackView.addArrangedSubview(nameLabel)
        bioStackView.addArrangedSubview(descrioptionLabel)
        bioStackView.setCustomSpacing(3, after: descrioptionLabel)
        bioStackView.addArrangedSubview(cityLabel)
        
        skilsStackView.addArrangedSubview(mySkillsLabel)
        skilsStackView.addArrangedSubview(editButton)
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
            skilsStackView.heightAnchor.constraint(equalToConstant: 24),
            
            tagsCollectionView.topAnchor.constraint(equalTo: skilsStackView.bottomAnchor, constant: 20),
            tagsCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tagsCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tagsCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            
        ])
    }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tags.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let tag = tags[indexPath.row].skill
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TagCollectionViewCell.identifier, for: indexPath) as? TagCollectionViewCell else { return UICollectionViewCell() }
        cell.configure(with: tag)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) else { return }
        
        if indexPath.row == tags.count - 1, tags[indexPath.row].skill == "+" {
            UIView.animate(withDuration: 0, animations: { cell.alpha = 0.5 }) { (completed) in
                    UIView.animate(withDuration: 0.5, animations: { cell.alpha = 1 })
                }
            
            showAlert(withTitle: "Добавление навыка", message: "Введите название навыка которым вы владеете") { newSkill in
                print("Добавлено: \(newSkill)")
                self.tags.insert(Tag(skill: newSkill), at: self.tags.count - 1)
                collectionView.reloadData()
            }
        }
    }
}

