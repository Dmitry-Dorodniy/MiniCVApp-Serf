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
//    private var data = MockData()
    
    private lazy var tagsCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: createCollectionLayout())
        collectionView.backgroundColor = .systemBackground
        collectionView.register(ProfileCell.self, forCellWithReuseIdentifier: ProfileCell.identifier)
        collectionView.register(TagCell.self, forCellWithReuseIdentifier: TagCell.identifier)
        collectionView.register(AboutCell.self, forCellWithReuseIdentifier: AboutCell.identifier)
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
        switch sections[indexPath.section] {
        case .profile(let item):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProfileCell.identifier, for: indexPath) as? ProfileCell else { return UICollectionViewCell() }
            cell.configure(with: item[indexPath.row])
            return cell
        default:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TagCell.identifier, for: indexPath) as? TagCell else { return UICollectionViewCell() }
            cell.configure(with: "Mock")
            return cell
        }
//        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TagCell.identifier, for: indexPath) as? TagCell else { return UICollectionViewCell() }
//        cell.configure(with: "Mock")
//        return cell
    }
}

//#Preview {
//    SkillsViewController()
//}
