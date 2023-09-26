//
//  AboutSelfCell.swift
//  MiniCVApp-Serf
//
//  Created by Dmitry Dorodniy on 21.09.2023.
//

import UIKit

class AboutSelfCell: UICollectionViewCell {
    
    static let identifire = "AboutSelfCell"
    
    private lazy var selfLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    
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
    }
    
    private func setupHierrarchy() {
        contentView.addSubViewsForAutoLayout([selfLabel])
    }
    
    private func setupLayout() {
    }
}
