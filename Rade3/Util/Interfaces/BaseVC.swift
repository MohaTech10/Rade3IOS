//
//  BaseVC.swift
//  Rade3
//
//  Created by Mohammed mohsen on 2/19/21.
//

import UIKit

class BaseVC: UIViewController {
    internal let childViewController = HeaderContainer()
    override func viewDidLoad() {
        super.viewDidLoad()
        add(childViewController)
        childViewController.view.anchor(fromTop: view.topAnchor, fromLeading: view.leadingAnchor, fromBottom: nil, fromTrailing: view.trailingAnchor)
//        viewWillAppear(true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    
}
