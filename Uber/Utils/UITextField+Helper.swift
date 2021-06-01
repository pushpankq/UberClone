//
//  UITextField+Helper.swift
//  Uber
//
//  Created by Puspank Kumar on 01/06/21.
//

import UIKit


extension UITextField {
    func textField(withPlaceholder placeholder: String, isSecureTextEntry: Bool = false) -> UITextField {
        
        let tf = UITextField()
        tf.borderStyle = .none
        tf.font = UIFont.systemFont(ofSize: 16)
        tf.textColor = .white
        tf.keyboardAppearance = .dark
        tf.isSecureTextEntry = isSecureTextEntry
        tf.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor : UIColor.lightGray])
        return tf
        
    }
}
