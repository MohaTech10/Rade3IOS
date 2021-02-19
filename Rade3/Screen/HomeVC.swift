//
//  HomeVC.swift
//  Rade3
//
//  Created by Mohammed mohsen on 2/19/21.
//

import UIKit

class HomeVC: UIViewController {

    private let rade3Character: UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "ثععثع-04 2")
        iv.contentMode = .scaleAspectFit
        iv.setDimension(width: 195.82, height: 400)
        return iv
    }()
    
    private let nextButtonContainer: UIView = {
        let container = UIView()
        container.backgroundColor = .systemBlue
        container.setDimension(width: 80, height: 78)
        container.layer.cornerRadius = 78 / 2
        return container
    }()
    
    private let homeWelcome: UILabel =  {
        let h = UILabel()
        h.numberOfLines = 0
        h.text = "مرحبا انا صديقك وأنا هنا لمساعدتك"
        
        return h
    }()
    private let nextButton: UIButton = {
        let b = UIButton()
//        b.backgroundColor = .systemGreen
        b.setImage(#imageLiteral(resourceName: "Component 1"), for: .normal)
        b.setDimension(width: 60, height: 60)
        b.layer.cornerRadius = 60 / 2
        return b
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubviews(withViews: rade3Character, nextButtonContainer, homeWelcome)
        nextButtonContainer.addSubview(nextButton)
        view.backgroundColor = .systemBackground
        rade3Character.center(inView: view)
        
        nextButtonContainer.anchor(fromTop: rade3Character.bottomAnchor, fromLeading: nil, fromBottom: nil, fromTrailing: nil, padding: .init(top: 20, left: 0, bottom: 0, right: 0))
        nextButtonContainer.centerX(inView: rade3Character, topAnchor: nil)
        
        nextButton.center(inView: nextButtonContainer)
        
        homeWelcome.anchor(fromTop: nil, fromLeading: nil, fromBottom: rade3Character.topAnchor, fromTrailing: nil)
        homeWelcome.centerX(inView: rade3Character, topAnchor: nil)
    }

}
