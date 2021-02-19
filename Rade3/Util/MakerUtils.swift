//
//  MakerUtils.swift
//  Rade3
//
//  Created by Mohammed mohsen on 2/19/21.
//

import Foundation
import UIKit

struct MakerUtils {
    static func createInputViewContainer(withImage image: UIImage?, textField: UITextField) -> UIView {
        // this is the view that will contain all the insider components such us Email Icon and the textField and basically this view is embedded inside a stack to stack the views
        let view = UIView()
        let imageContainer = UIImageView()
        view.addSubview(imageContainer)
        if let image = image {
            imageContainer.image = image
            
            
        }
        imageContainer.clipsToBounds = true
        view.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        
        
        imageContainer.anchor(fromTop: nil, fromLeading: view.leadingAnchor, fromBottom: nil, fromTrailing: nil, padding: .init(top: 0, left: 0, bottom: 0, right: 0), size: .init(width: 44, height: 44))
        
        
        // Edit and style the textField
        
        view.addSubview(textField)
        textField.anchor(fromTop: nil, fromLeading: imageContainer.trailingAnchor, fromBottom: view.bottomAnchor, fromTrailing: view.trailingAnchor, padding: .init(top: 0, left: 8, bottom: -8, right: 0))
        imageContainer.centerY(inView: textField , leadingAnchor: nil)
        let separator = UIView()
        separator.backgroundColor = .separator
        view.addSubview(separator)
        separator.anchor(fromTop: nil, fromLeading: view.leadingAnchor, fromBottom: view.bottomAnchor, fromTrailing: view.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 0), size: .init(width: 0, height: 0.9))
        return view
    }
    
    
    static func createTextField(withPlaceHolder placeholder: String, height: CGFloat? = 56) -> UITextField {
        let tf = UITextField()
        tf.textColor = Theme.Colors.placeHolder
        tf.backgroundColor = Theme.Colors.fieldBG
        
        tf.borderStyle = .roundedRect
    
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.heightAnchor.constraint(equalToConstant: height!).isActive = true
        tf.font = UIFont.systemFont(ofSize: 20)
        tf.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor: Theme.Colors.placeHolder ])
        return tf
    }
//    func activityButton(withTitle title: String, withImage image: UIImage) -> UIButton {
//        let b = UIButton()
//        b.setTitle(title, for: .normal)
//        b.setTitleColor(.systemGray, for: .normal)
//        b.setImage(image, for: .normal)
//        b.titleEdgeInsets = .init(top: 0, left: 8, bottom: 0, right: 0)
//        b.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
//        return b
//    }
}
