//
//  MockData.swift
//  MiniCVApp-Serf
//
//  Created by Dmitry Dorodniy on 27.09.2023.
//

import Foundation

struct MockData {
    
    static let shared = MockData()
    
    private let profile: Section = {
        .profile([.init(image: "icon",
                        title: "Дородний Дмитрий Александрович",
                       subtitle: "Middle iOS-разработчик, опыт более 2-х лет")])
    }()
    
    private let skills: Section = {
        .skills([.init(title: "MVI/MVVM"),
                 .init(title: "Kotlin very hard super complication compositional"),
                 .init(title: "Realm"),
                 .init(title: "SWIFT UI"),
                 .init(title: "REST API"),
                 .init(title: "UI KIt"),
                 .init(title: "VIPER"),
                 .init(title: "SOLID"),
                 .init(title: "CocoaPods")
                ])
    }()
    
    private let about: Section = {
        .about([.init(title: "Experienced software engineer skilled in developing scalable and maintainable systems")])
    }()
    
    var pageData: [Section] {
        [profile, skills, about]
    }
}
