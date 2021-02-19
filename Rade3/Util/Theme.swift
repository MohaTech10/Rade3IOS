//
//  Theme.swift
//  Rade3
//
//  Created by Mohammed mohsen on 2/19/21.
//

import Foundation
import UIKit

struct Theme {

    static func apply(to window: UIWindow) {
//        
//        window.tintColor = Colors.purple
//        // create proxy
//        
//        let tabBar = UITabBar.appearance()
//        let navBar = UINavigationBar.appearance()
//        tabBar.barTintColor = Colors.gray3
//        navBar.barTintColor = Colors.gray3
//        navBar.titleTextAttributes = [.foregroundColor: Colors.gray0]
//        let searchBarTextFields = UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self])  // this way we will get all the textFields that only inside the saerchBars not all textFields in our app
//        
//        searchBarTextFields.defaultTextAttributes = [
//            .foregroundColor: Colors.gray1,
//            .font: UIFont.boldSystemFont(ofSize: 14)
//        ]
    }
    
    
//    var color: Colors // Typiclly
    struct Colors {
        static var rade3Blue = #colorLiteral(red: 0.1254901961, green: 0.5450980392, blue: 0.8235294118, alpha: 1)
        static var rade3Green = #colorLiteral(red: 0.3490196078, green: 0.7137254902, blue: 0.1254901961, alpha: 1)
        static var fieldBG = #colorLiteral(red: 0.9215686275, green: 0.8941176471, blue: 0.8470588235, alpha: 1)
        static var placeHolder = #colorLiteral(red: 0.6941176471, green: 0.6745098039, blue: 0.6666666667, alpha: 1)
        
    }
}
