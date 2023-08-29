//
//  TagCollectionViewCell.swift
//  MiniCVApp-Serf
//
//  Created by Dmitry Dorodniy on 01.08.2023.
//

import UIKit

class TagCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "TagCollectionViewCell"
    
    private lazy var tagLable: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 1
        label.lineBreakMode = .byTruncatingTail
        label.textAlignment = .center
        return label
    }()
    
    func configure(with data: String) {
        tagLable.text = data
        tagLable.sizeToFit()
    }
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
       
        setupView()
        setupHierrarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
 
    // MARK: - Setups
    
    private func setupView() {
        backgroundColor = .systemGray5
        layer.cornerRadius = 12
        layer.borderColor = UIColor.gray.cgColor
        layer.borderWidth = 1
    }
    
    private func setupHierrarchy() {
        contentView.addSubViewsForAutoLayout([tagLable])
    }
    
    private func setupLayout() {
        guard let screenWidth = UIScreen.current?.bounds.size.width else { return }
        
        print("UIScreen.main.bounds.size.width \(UIScreen.main.bounds.size.width)")
        print(contentView.frame.size.width)
     
        NSLayoutConstraint.activate([
            tagLable.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            tagLable.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
            tagLable.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            contentView.widthAnchor.constraint(lessThanOrEqualToConstant: screenWidth - 32)
        ])
    }
}
