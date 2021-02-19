//
//  FormVC.swift
//  Rade3
//
//  Created by Mohammed mohsen on 2/19/21.
//

import UIKit

class FormVC: BaseVC {
    
    var horizontalSpace = 20 / 2;
    lazy var verticalSpace = 60 / 2;      // vert. space b/w rectangles
    var rectangleWidth = 70 // rectangle width
    lazy var rectangleHeight = rectangleWidth;
    private let blackMailer: UILabel = {
        let labe = UILabel()
        labe.text = "مين مضايقك"
        labe.font = UIFont(name: "Optima-Bold", size: 25)
        labe.textColor = .label
        return labe
    }()
    private let nextButton: UIButton = {
        let b = UIButton()
        //        b.backgroundColor = .systemGreen
        b.setImage(#imageLiteral(resourceName: "Component 1"), for: .normal)
        b.setDimension(width: 60, height: 60)
        b.layer.cornerRadius = 60 / 2
        b.addTarget(self, action: #selector(genericMethod), for: .touchUpInside)
        return b
    }()
    
    private let nextLabel: UILabel = {
        let s = UILabel()
        s.text = "التالي"
        s.font = UIFont(name: "Optima-Bold", size: 18)
        return s
    }()
    
    private lazy var usernameViewContainer = MakerUtils.createInputViewContainer(withImage: #imageLiteral(resourceName: "ic_person_outline_white_2x").withTintColor(.label), textField: blackmailerName)
    private let blackmailerName = MakerUtils.createTextField(withPlaceHolder: "أكتب اسمه ...")
    
    private lazy var fullnameViewContainer = MakerUtils.createInputViewContainer(withImage: nil, textField: whichApp)
    
    private let whichApp = MakerUtils.createTextField(withPlaceHolder: "في أي برنامج ضايقك...")
    override func viewDidLoad() {
        super.viewDidLoad()
        
        whichApp.delegate = self
        blackmailerName.delegate = self
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        view.addGestureRecognizer(tap) // Add gesture recognizer to background view
        
        let hStack = UIStackView(arrangedSubviews: [nextButton,nextLabel])
        view.addSubviews(withViews: blackMailer, hStack)
        hStack.distribution = .fillEqually
        hStack.axis = .horizontal
        hStack.spacing = 8
        
        blackMailer.anchor(fromTop: childViewController.view.bottomAnchor, fromLeading: view.leadingAnchor, fromBottom: nil, fromTrailing: view.trailingAnchor, padding: .init(top: 20, left: 8, bottom: 0, right: -8))
        setStackForSignViews()
        view.backgroundColor = .systemBackground
        
        
        hStack.anchor(fromTop: nil, fromLeading: nil , fromBottom: view.bottomAnchor, fromTrailing: nil, padding: .init(top: 0, left: 0, bottom: -50, right: 0))
        hStack.centerX(inView: self.view, topAnchor: nil)
        
    }
    
    func setStackForSignViews() {
        
        let stackVertical = UIStackView(arrangedSubviews: [
            usernameViewContainer, fullnameViewContainer
        ])
        view.addSubview(stackVertical)
        stackVertical.axis = .vertical
        stackVertical.distribution = .fillEqually
        stackVertical.spacing = 20
        
        stackVertical.anchor(fromTop: blackMailer.bottomAnchor, fromLeading: view.safeAreaLayoutGuide.leadingAnchor, fromBottom: nil, fromTrailing: view.safeAreaLayoutGuide.trailingAnchor, padding: .init(top: 40 , left: 16, bottom: 0, right: -16))
        //
        
        // rectangle height
        var x = horizontalSpace;  // we don't wanna manipulate the horizontalSpace so that it remains the same value for the purpose of this algorithm we wanna alter it so we create a reference/pointer of this
        var y = verticalSpace;
        let array: [UIImage] = [#imageLiteral(resourceName: "youtube"), #imageLiteral(resourceName: "instagram"), #imageLiteral(resourceName: "whatsapp"), #imageLiteral(resourceName: "twitter"), #imageLiteral(resourceName: "facebook"), #imageLiteral(resourceName: "tik-tok")]
        for i in 0..<array.count {
            
            let button = UIButton()
            view.addSubview(button)
            button.setImage(array[i], for: .normal)
            
            button.clipsToBounds = true
            button.setDimension(width:50, height: 50)
            button.layer.cornerRadius = 50 / 2
            if i % 5 == 0 && i != 0 {
                y +=  rectangleHeight + verticalSpace;
                x = horizontalSpace;
            }
            button.anchor(fromTop: stackVertical.bottomAnchor, fromLeading: view.leadingAnchor, fromBottom: nil , fromTrailing: nil, padding: .init(top: CGFloat(y), left: CGFloat(x), bottom: 0, right: 0))
            
            x += rectangleWidth + horizontalSpace;
        }
    }
    
    @objc func genericMethod() {
        // strategy pattern
        let las = LastFormVC()
//        las.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(las, animated: true)
    }
    
    @objc func handleTap() {
        blackmailerName.resignFirstResponder() // dismiss keyoard
        whichApp.resignFirstResponder()
    }
}
extension FormVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder() // dismiss keyboard
        return true
    }
}
