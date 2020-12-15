//
//  EmptyState.swift
//  Wolfish
//
//  Created by Petre Vane on 15/12/2020.
//

import SwiftUI

struct EmptyState: View {
    
    var imageName: String
    var textMessage: String
    
    var body: some View {
        ZStack {
            Color(.systemGroupedBackground).ignoresSafeArea(edges: .all)
            
            VStack {
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 250)
                
                Text(textMessage)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(Color(.secondaryLabel))
                    .padding()
                    
            }
        }
    }
}

struct EmptyState_Previews: PreviewProvider {
    static var previews: some View {
        EmptyState(imageName: Images.emptyOrder, textMessage: " This is a very long text message. Again, this is a very long text message.")
            .preferredColorScheme(.light)
    }
}
