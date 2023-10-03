//
//  TagCell.swift
//  MiniCVApp-Serf
//
//  Created by Dmitry Dorodniy on 02.10.2023.
//

import UIKit

class TagCell: UICollectionViewCell {
    
    static let identifier = "TagCell"
    
    var tapHandler: (() -> Void)?
    
    var isEdit = false
    private var tagLabelTrailing = NSLayoutConstraint()
    private var tagLabelEditTrailing = NSLayoutConstraint()
    
    
    private lazy var tagLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 1
        label.lineBreakMode = .byTruncatingTail
        return label
    }()
    
    private lazy var xImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "xmark")
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .systemGray
        imageView.isUserInteractionEnabled = true
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        imageView.addGestureRecognizer(tapGestureRecognizer)
        return imageView
    }()
    
    func configure(with data: String) {
        tagLabel.text = data
        guard data != "+" else { return }
        updateLayout()
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
    }
    
    private func setupHierrarchy() {
        contentView.addSubViewsForAutoLayout([tagLabel, xImage])
    }
    
    private func setupLayout() {
        guard let screenWidth = UIScreen.current?.bounds.size.width else { return }
        
        tagLabelTrailing = tagLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24)
        tagLabelEditTrailing =  tagLabel.trailingAnchor.constraint(lessThanOrEqualTo: xImage.leadingAnchor, constant: -10)
        
        NSLayoutConstraint.activate([
            tagLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            tagLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            xImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
            xImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            xImage.heightAnchor.constraint(equalToConstant: 15),
            
            contentView.widthAnchor.constraint(lessThanOrEqualToConstant: screenWidth - 32)
        ])
    }
    
    private func updateLayout() {
        xImage.isHidden = !isEdit
        tagLabelTrailing.isActive = !isEdit
        tagLabelEditTrailing.isActive = isEdit
        contentView.layoutIfNeeded()
    }
    
    // MARK: - Action
    @objc func handleTap() {
        print("X tapped")
        tapHandler?()
    }
}
