//
//  HomeVC.swift
//  Rade3
//
//  Created by Mohammed mohsen on 2/19/21.
//

import UIKit
import AVFoundation
class HomeVC: BaseVC {
    
    
    
    var player : AVAudioPlayer?
    private static let firstRunDefaultsKey = "ShownFirstRun"
    
    /// True when this is the first time the app has been launched.
    var isFirstRun: Bool {
        return UserDefaults.standard.bool(forKey: HomeVC.firstRunDefaultsKey) == false
    }
    private let rade3Character: UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "ثععثع-04 2")
        iv.contentMode = .scaleAspectFit
        
        iv.setDimension(width: 195.82, height: 400)
        return iv
    }()
    
    private let nextButtonContainer: UIView = {
        let container = UIView()
        container.backgroundColor = Theme.Colors.rade3Blue
        container.setDimension(width: 80, height: 78)
        container.layer.cornerRadius = 78 / 2
        return container
    }()
    
    private lazy var homeWelcome: UILabel =  {
        let h = UILabel()
        h.numberOfLines = 0
        h.font = UIFont(name: "Optima-Bold", size: 25)
        
        let text = "مرحبا انا صديقك وأنا هنا لمساعدتك"
        h.text = text
        return h
    }()
    
    private lazy var rade3Name: UILabel =  {
        let h = UILabel()
        h.numberOfLines = 0
        h.font = UIFont(name: "Optima-Bold", size: 25)
        
        let text = "رادع"
        h.text = text
        return h
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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubviews(withViews: rade3Character, nextButtonContainer, homeWelcome, rade3Name)
        nextButtonContainer.addSubview(nextButton)
        view.backgroundColor = .systemBackground
        rade3Character.center(inView: view)
        
        
        
        
        nextButtonContainer.anchor(fromTop: rade3Character.bottomAnchor, fromLeading: nil, fromBottom: nil, fromTrailing: nil, padding: .init(top: 20, left: 0, bottom: 0, right: 0))
        nextButtonContainer.centerX(inView: rade3Character, topAnchor: nil)
        
        nextButton.center(inView: nextButtonContainer)
        
        homeWelcome.anchor(fromTop: nil, fromLeading: nil, fromBottom: rade3Character.topAnchor, fromTrailing: nil, padding: .init(top: 0, left: 0, bottom: -30, right: 0))
        homeWelcome.centerX(inView: rade3Character, topAnchor: nil)
        
        rade3Name.anchor(fromTop: homeWelcome.bottomAnchor, fromLeading: nil, fromBottom: rade3Character.topAnchor, fromTrailing: nil)
        rade3Name.centerX(inView: rade3Character, topAnchor: nil)
        if isFirstRun {
            /// If this is the first time the app is running, wait a tiny fraction of time before showing the welcome screen.
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [weak self] in
                self?.playSound()
                
                
                // Mark that we've run the app at least once.
                UserDefaults.standard.set(true, forKey: HomeVC.firstRunDefaultsKey)
            }
        }
        
    }
    
    @objc func genericMethod() {
        
        navigationController?.pushViewController(FormVC(), animated: true)
    }
    
    
    func playSound()
    {
        guard let path = Bundle.main.path(forResource: "WhatsApp Audio 2021-02-20 at 12.35.57 AM", ofType:"mp4") else { return }
        
        
        let url = URL(fileURLWithPath: path)
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
            
        } catch {
            // couldn't load file :(
            print("DEBUG: " , error.localizedDescription)
        }
    }
}
