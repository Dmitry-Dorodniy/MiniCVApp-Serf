//
//  UIView+Ext.swift
//  MiniCVApp-Serf
//
//  Created by Dmitry Dorodniy on 01.08.2023.
//

import UIKit

extension UIView {
    func addSubViewsForAutoLayout(_ views: [UIView]) {
        views.forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }
    }
}

