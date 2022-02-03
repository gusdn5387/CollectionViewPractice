//
//  ListViewPresenter.swift
//  CollectionViewPractice
//
//  Created by Byapps on 2022/02/03.
//

import UIKit

protocol ListProtocol: AnyObject {
    func setupLayout()
}

final class ListPresenter: NSObject {
    private weak var viewController: ListProtocol?
    
    private var testValue: [List] = [
        List(title: "1번째", description: "11111111"),
        List(title: "2번째", description: "22222222"),
        List(title: "3번째", description: "33333333"),
        List(title: "4번째", description: "44444444"),
        List(title: "5번째", description: "55555555"),
        List(title: "6번째", description: "66666666"),
        List(title: "7번째", description: "77777777"),
        List(title: "8번째", description: "88888888"),
        List(title: "9번째", description: "99999999")
    ]
    
    init(viewController: ListProtocol) {
        self.viewController = viewController
    }
    
    func viewDidLoad() {
        viewController?.setupLayout()
    }
}

extension ListPresenter: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let spacing: CGFloat = 10.0
        let width: CGFloat = collectionView.frame.width - spacing * 2
        return CGSize(width: width, height: 100.0)
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        let inset: CGFloat = 10.0
//        return UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
//    }
}

extension ListPresenter: UICollectionViewDelegate {
    
}

extension ListPresenter: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return testValue.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ListCollectionViewCell.identifier, for: indexPath) as? ListCollectionViewCell
        
        let val = testValue[indexPath.item]
        cell?.update(val)
        
        return cell ?? UICollectionViewCell()
    }
}
