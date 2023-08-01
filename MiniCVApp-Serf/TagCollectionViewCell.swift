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
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.cornerRadius = 12
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        layer.cornerRadius = 12
    }
    
    private func setupHierrarchy() {
        contentView.addSubViewsForAutoLayout([tagLable])
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            tagLable.centerXAnchor.constraint(equalTo: centerXAnchor),
            tagLable.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
