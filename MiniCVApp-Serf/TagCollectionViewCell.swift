//
//  TagCollectionViewCell.swift
//  MiniCVApp-Serf
//
//  Created by Dmitry Dorodniy on 01.08.2023.
//

import UIKit

class TagCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "TagCollectionViewCell"
    
    var tapHandler: (() -> Void)?
    
    var isEdit = false
    private var tagLabelTrailing = NSLayoutConstraint()
    private var tagLabelEditTrailing = NSLayoutConstraint()
    
    
    private lazy var tagLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 1
        label.lineBreakMode = .byTruncatingTail
//        label.textAlignment = .center
        return label
    }()
    
    private lazy var xImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "xmark")
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .systemGray
        imageView.isUserInteractionEnabled = true
        return imageView
    }()
    
    func configure(with data: String) {
        print(isEdit)
        
        tagLabel.text = data
//        tagLabel.sizeToFit()
//        tagLabel.invalidateIntrinsicContentSize()
        
        
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
//        layer.borderColor = UIColor.gray.cgColor
//        layer.borderWidth = 1
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap))
            xImage.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc func handleTap() {
            // Вызываем делегата при нажатии на tappableView
           print("X tapped")
         tapHandler?()
        }
    
    private func setupHierrarchy() {
        contentView.addSubViewsForAutoLayout([tagLabel, xImage])
    }
    
    private func setupLayout() {
        guard let screenWidth = UIScreen.current?.bounds.size.width else { return }
        
//        print("UIScreen.main.bounds.size.width \(UIScreen.main.bounds.size.width)")
//        print(contentView.frame.size.width)
     
        tagLabelTrailing = tagLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24)
        tagLabelEditTrailing =  tagLabel.trailingAnchor.constraint(lessThanOrEqualTo: xImage.leadingAnchor, constant: -10)
//        tagLabelTrailing.isActive = !isEdit
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
}
