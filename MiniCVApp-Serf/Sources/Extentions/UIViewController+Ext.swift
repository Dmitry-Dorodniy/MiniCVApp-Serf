//
//  UIViewController+Ext.swift
//  MiniCVApp-Serf
//
//  Created by Dmitry Dorodniy on 01.09.2023.
//

import UIKit

extension UIViewController {
    func dismissKeyboard() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer( target: self,
                                                                  action: #selector(dismissKeyboardTouchOutside))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc private func dismissKeyboardTouchOutside() {
        view.endEditing(true)
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
