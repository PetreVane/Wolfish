//
//  TestView.swift
//  Wolfish
//
//  Created by Petre Vane on 14/12/2020.
//

import SwiftUI

struct TestView: View {
    init() { customNavigationBar() }
    @State private var meals = MockData.meals
    
    var body: some View {

        Text("help")
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
