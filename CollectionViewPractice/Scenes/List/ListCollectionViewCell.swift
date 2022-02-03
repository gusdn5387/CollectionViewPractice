//
//  ListCollectionViewCell.swift
//  CollectionViewPractice
//
//  Created by Byapps on 2022/02/03.
//

import UIKit
import SnapKit

final class ListCollectionViewCell: UICollectionViewCell {
    static let identifier = "ListCollectionViewCell"
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14.0, weight: .semibold)
        
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12.0, weight: .medium)
        
        return label
    }()
    
    func update(_ list: List) {
        setupCell()
        setupLayout()
        
        titleLabel.text = list.title
        descriptionLabel.text = list.description
    }
}

private extension ListCollectionViewCell {
    func setupCell() {
        layer.cornerRadius = 12.0
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.1
        layer.shadowRadius = 8.0
        
        backgroundColor = .systemBackground
    }
    
    func setupLayout() {
        [titleLabel, descriptionLabel].forEach { addSubview($0) }
        
        titleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(10.0)
            make.top.equalToSuperview().inset(10.0)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.leading.equalTo(titleLabel.snp.leading)
            make.top.equalTo(titleLabel.snp.top).offset(10.0)
            make.bottom.equalToSuperview().inset(10.0)
        }
    }
}
