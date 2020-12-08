//
//  LoadingView.swift
//  Wolfish
//
//  Created by Petre Vane on 27/11/2020.
//

import SwiftUI

struct LoadingView: View {
    
    var body: some View {
        ProgressView("Hold your horses ...")
            .progressViewStyle(MyProgressStyle(color: Color(.tertiarySystemBackground)))
            .shadow(radius: 10)
            .foregroundColor(Color(.label))
            .font(.some(.system(size: 20, weight: .medium, design: .rounded)))
            
    }
    
}

struct MyProgressStyle: ProgressViewStyle {
    let color: Color
    func makeBody(configuration: Configuration) -> some View {
        ProgressView(configuration)
            .padding(30)
            .background(RoundedRectangle(cornerRadius: 15)
            .fill(color))
    }
}


struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LoadingView().preferredColorScheme(.light)
            LoadingView().preferredColorScheme(.dark)
        }
    }
}
