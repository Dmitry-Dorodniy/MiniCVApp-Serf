//
//  SkillsViewController.swift
//  MiniCVApp-Serf
//
//  Created by Dmitry Dorodniy on 27.09.2023.
//

import UIKit

class SkillsViewController: UIViewController {

//    private var isEdit = false {
//        didSet {
//            editButton.setNeedsUpdateConfiguration()
//        }
//    }
    
    private let sections = MockData.shared.pageData
    
    private lazy var tagsCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: createCollectionLayout())
        collectionView.backgroundColor = .systemBackground
        collectionView.register(TagCollectionViewCell.self, forCellWithReuseIdentifier: TagCollectionViewCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
//        collectionView.bounces = false
        return collectionView
    }()
    
    // MARK: - Private Functions
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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        setupHierarchy()
        setupLayuot()
    }

    // MARK: - Setups
    private func setupView() {
        view.backgroundColor = .systemGray5
        title = "Профиль"
        dismissKeyboard()
    }
    
    private func setupHierarchy() {
        view.addSubview(tagsCollectionView)
    }
    
    private func setupLayuot() {
        NSLayoutConstraint.activate([
            tagsCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            tagsCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tagsCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tagsCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            
        ])
    }
}

extension SkillsViewController: UICollectionViewDelegate {
    
}

extension SkillsViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        sections[section].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TagCollectionViewCell.identifier, for: indexPath) as? TagCollectionViewCell else { return UICollectionViewCell() }
        cell.configure(with: "Mock")
        return cell
    }
}

#Preview {
    SkillsViewController()
}
