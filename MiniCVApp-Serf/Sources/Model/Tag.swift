//
//  Tag.swift
//  MiniCVApp-Serf
//
//  Created by Dmitry Dorodniy on 01.08.2023.
//

import Foundation

struct Tag {
    var skill: String
}

extension Tag {
    static var getData: [Tag] {
        [Tag(skill: "MVI/MVVM"),
         Tag(skill: "Kotlin very hard super complication compositional"),
         Tag(skill: "Room"),
         Tag(skill: "OkHttp"),
         Tag(skill: "Swift UI"),
         Tag(skill: "SPManager"),
         Tag(skill: "VIPER"),
         Tag(skill: "SOLID"),
         Tag(skill: "REST API"),
        ]
    }
}
