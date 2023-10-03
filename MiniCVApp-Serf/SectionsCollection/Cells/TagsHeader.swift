//
//  TagsHeader.swift
//  MiniCVApp-Serf
//
//  Created by Dmitry Dorodniy on 03.10.2023.
//

import UIKit

class TagsHeader: UICollectionReusableView {
    
    static let identifier = "TagsHeader"
    
    private var isEdit = false {
        didSet {
            editButton.setNeedsUpdateConfiguration()
        }
    }
    
    private lazy var skilsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        return stackView
    }()
    
    private lazy var mySkillsLabel: UILabel = {
        let label = UILabel()
        label.text = "Мои навыки"
        
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return label
    }()
    
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
    
    @objc private func didEditButtonPress() {
//        if !isEdit {
//            tags.append(Tag(skill: "+"))
//        } else {
//            tags.removeLast()
//        }
//        
//        tagsCollectionView.reloadData()
        isEdit.toggle()
    }
    
    func configure(with text: String) {
        mySkillsLabel.text = text
    }
    
    // MARK: - Lifecycles
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupHierarchy() {
        skilsStackView.addArrangedSubview(mySkillsLabel)
        skilsStackView.addArrangedSubview(editButton)
        addSubview(skilsStackView)
    }
    
    private func setupLayout() {
        
        NSLayoutConstraint.activate([
        skilsStackView.topAnchor.constraint(equalTo: topAnchor),
        skilsStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
        skilsStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
        skilsStackView.bottomAnchor.constraint(equalTo: bottomAnchor)])
    }
    
    
}
