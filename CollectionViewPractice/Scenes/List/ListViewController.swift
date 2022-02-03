//
//  ViewController.swift
//  CollectionViewPractice
//
//  Created by Byapps on 2022/02/03.
//

import UIKit
import SnapKit

final class ListViewController: UIViewController {
    private lazy var presenter = ListPresenter(viewController: self)
    
    private lazy var listView: UICollectionView = {
        let collectionViewLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        
        collectionView.backgroundColor = .systemBackground
        collectionView.delegate = presenter
        collectionView.dataSource = presenter
        
        collectionView.register(ListCollectionViewCell.self, forCellWithReuseIdentifier: ListCollectionViewCell.identifier)
        
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.viewDidLoad()
    }
}

extension ListViewController: ListProtocol {
    func setupLayout() {
        view.addSubview(listView)
        
        listView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
