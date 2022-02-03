//
//  List.swift
//  CollectionViewPractice
//
//  Created by Byapps on 2022/02/03.
//

import Foundation

struct List: Decodable {
    let title: String
    let description: String
    
    init(title: String, description: String) {
        self.title = title
        self.description = description
    }
}
