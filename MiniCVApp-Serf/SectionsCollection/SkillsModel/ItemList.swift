//
//  Item.swift
//  MiniCVApp-Serf
//
//  Created by Dmitry Dorodniy on 27.09.2023.
//

import Foundation

struct ItemList: Hashable {
    var image: String?
    var title: String
    var subtitle: String?
}

enum Section {
    case profile([ItemList])
    case skills([ItemList])
    case about([ItemList])
    
    var items: [ItemList] {
        switch self {
        case .profile(let profile):
            return profile
        case .skills(let tags):
            return tags
        case .about(let about):
            return about
        }
    }
    
    var count: Int {
        return items.count
    }
    
    var title: String {
        switch self {
        case .profile(_):
            ""
        case .skills(_):
            "Мои навыки"
        case .about(_):
            "О себе"
        }
    }
}
