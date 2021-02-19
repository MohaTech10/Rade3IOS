//
//  LastFormVC.swift
//  Rade3
//
//  Created by Mohammed mohsen on 2/19/21.
//

import UIKit

class LastFormVC: BaseVC {
    
    private let imagePicker = UIImagePickerController()  // this allows us to open the photo app to pick a button
    
    private var actualProfileImage: UIImage?
    private let selectImageButton: UIButton =  {
        let button = UIButton(type: .system)
//        button.setImage(#imageLiteral(resourceName: "Ellipse 3"), for: .normal)
        button.backgroundColor = Theme.Colors.rade3Blue
        button.layer.cornerRadius = 7
        button.layer.masksToBounds = true
        button.setTitleColor(.label, for: .normal)
        button.setTitle("صورلي الشاشة", for: .normal)
        button.titleLabel?.font = UIFont(name: "Optima-Bold", size: 18)
        button.addTarget(self, action: #selector(selectImageBtnTapped), for: .touchUpInside)
        return button
    }()
    
    private let send: UIButton =  {
        let button = UIButton(type: .system)
//        button.setImage(#imageLiteral(resourceName: "Ellipse 3"), for: .normal)
        button.backgroundColor = Theme.Colors.rade3Green
        button.layer.cornerRadius = 7
        button.layer.masksToBounds = true
        button.setDimension(width: 150, height: 50)
        button.isHidden = true
        button.setTitleColor(.label, for: .normal)
        button.setTitle("أرسل", for: .normal)
        button.addTarget(self, action: #selector(selectImageBtnTapped), for: .touchUpInside)
        return button
    }()
    
    private let imagePreview: UIImageView = {
        let iv = UIImageView()
        iv.isHidden = true
        iv.setDimension(width: 120, height: 120)
        iv.layer.cornerRadius = 120 / 2
        
        return iv
    }()
    private let headerTitle: UILabel = {
        let labe = UILabel()
        labe.text = "حكيني اكثر"
        labe.font = UIFont(name: "Optima-Bold", size: 25)
        labe.textColor = .label
        return labe
    }()
    

    private lazy var descriptionContainer = MakerUtils.createInputViewContainer(withImage: nil, textField: descriptionField)
    
    private let descriptionField = MakerUtils.createTextField(withPlaceHolder: "كيف يضايقك...", height: 100)
    
    private lazy var usernameViewContainer = MakerUtils.createInputViewContainer(withImage: #imageLiteral(resourceName: "ic_person_outline_white_2x").withTintColor(.label), textField: blackmailerName)
    private let blackmailerName = MakerUtils.createTextField(withPlaceHolder: "كيف اتواصل معاك؟ (اختياري)")
    override func viewDidLoad() {
        super.viewDidLoad()
        let stackVertical = UIStackView(arrangedSubviews: [
            descriptionContainer, usernameViewContainer
        ])
        view.addSubviews(withViews: stackVertical, headerTitle)

        headerTitle.anchor(fromTop: childViewController.view.bottomAnchor, fromLeading: view.leadingAnchor, fromBottom: nil, fromTrailing: view.trailingAnchor, padding: .init(top: 20, left: 8, bottom: 0, right: -8))
        stackVertical.axis = .vertical
        stackVertical.distribution = .fillEqually
        stackVertical.spacing = 50
        
        stackVertical.anchor(fromTop: headerTitle.bottomAnchor, fromLeading: view.safeAreaLayoutGuide.leadingAnchor, fromBottom: nil, fromTrailing: view.safeAreaLayoutGuide.trailingAnchor, padding: .init(top: 80 , left: 16, bottom: 0, right: -16))
        
//        uploadProof.center(inView: self.view)
        
        
        
        
//        descriptionContainer.anchor(fromTop: headerTitle.bottomAnchor, fromLeading: view.leadingAnchor, fromBottom: nil, fromTrailing: view.trailingAnchor, padding: .init(top: 80, left: 0, bottom: 0, right: -20))
        view.backgroundColor = .systemBackground
        setUserProfileImageButton()
        configureUi()
    }
    
    
    func configureUi() {
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
    }
    
    func setUserProfileImageButton() {
        view.addSubviews(withViews: selectImageButton, imagePreview, send)
        selectImageButton.center(inView: view) // there is no padding i should move the keyboard up with the inputs field
        selectImageButton.setDimension(width: 180, height: 50)
        
        imagePreview.anchor(fromTop: selectImageButton.bottomAnchor, fromLeading: nil , fromBottom: nil , fromTrailing: nil, padding: .init(top: 20, left: 0, bottom: 0, right: 0))
        imagePreview.centerX(inView: selectImageButton, topAnchor: nil)
        
        
        send.anchor(fromTop: imagePreview.bottomAnchor, fromLeading: nil , fromBottom: nil , fromTrailing: nil, padding: .init(top: 23, left: 0, bottom: 0, right: 0))
        send.centerX(inView: imagePreview, topAnchor: nil)
        
    }
    @objc func selectImageBtnTapped() {
        present(imagePicker, animated: true, completion: nil)
        
    }
}


extension LastFormVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        // this method allows us to access the selected media whether video or image that will be through the info property
        guard let profileImage = info[.editedImage] as? UIImage else { return }  // it is optional to make sure this pro image exists this takes the selected image then we can send it cuz it's an expression
        
        imagePreview.isHidden = false
        send.isHidden = false
        imagePreview.contentMode = .scaleAspectFill  // it scales the image to fit the frame
        imagePreview.clipsToBounds = true  // to make sure the image does not go outside the frame
//        imagePreview.layer.borderColor = UIColor.white.cgColor
        imagePreview.layer.borderWidth = 2.5
        self.actualProfileImage = profileImage  // this is for the DB to send it later
        imagePreview.image = profileImage.withRenderingMode(.alwaysOriginal )
        dismiss(animated: true, completion: nil)
    }
}
