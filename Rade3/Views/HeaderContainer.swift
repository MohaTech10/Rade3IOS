//
//  HeaderContainer.swift
//  Rade3
//
//  Created by Mohammed mohsen on 2/19/21.
//

import UIKit

class HeaderContainer: UIViewController {
    
    private let header: UIImageView = {
        let header = UIImageView()
        header.image = #imageLiteral(resourceName: "Group 2")
        header.contentMode = .scaleAspectFit
        return header
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(header)
        header.anchor(fromTop: view.topAnchor, fromLeading: view.leadingAnchor, fromBottom: view.bottomAnchor, fromTrailing: view.trailingAnchor)
    }
    

}
