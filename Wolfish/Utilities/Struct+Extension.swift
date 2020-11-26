//
//  Struct+Extension.swift
//  Wolfish
//
//  Created by Petre Vane on 26/11/2020.
//

import UIKit
import SwiftUI


extension View {
    
    func customNavigationBar() {
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor(named: "brandPrimary")!, .font: UIFont(name: "American Typewriter Bold", size: 35)!]
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor(named: "brandPrimary")!, .font: UIFont(name: "American Typewriter Bold", size: 20)!]
        
        UINavigationBar.appearance().standardAppearance = navBarAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearance
        UINavigationBar.appearance().compactAppearance = navBarAppearance
    }
}


