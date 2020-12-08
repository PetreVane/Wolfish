//
//  DetailView.swift
//  Wolfish
//
//  Created by Petre Vane on 03/12/2020.
//

import SwiftUI

struct DetailView: View {
    
    var meal: MealItem
    @Binding var isDetailViewPresented: Bool

    
    var body: some View {
        VStack {
            RemoteImageLoader(imageURL: meal.imageURL)
                .frame(width: 350, height: 290, alignment: .center)
                .aspectRatio(contentMode: .fill)
            
            Spacer()
            
            VStack {
                Text(meal.name)
                    .font(.system(size: 25, weight: .regular, design: .rounded))
                
                HStack(spacing: 50) {
                    
                    NutritionalInfo(name: "Calories", values: "\(meal.calories)")
                    NutritionalInfo(name: "Carbs", values: "\(meal.carbs)")
                    NutritionalInfo(name: "Protein", values: "\(meal.protein)")
                    
                }.padding()
                
                WOrderButton(price: "£ \(meal.price, specifier: "%.1f") - Add to order list")
            }
            
            Spacer()
            
        }
        .frame(width: 350, height: 550)
        .background(Color(.tertiarySystemBackground))
        .cornerRadius(25)
        .shadow(color: Color(.label), radius: 35, x: 0, y: 0)
        .overlay(WDismissButton(isDetailViewPresented: $isDetailViewPresented), alignment: .topTrailing)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            DetailView(meal: MockData.sampleMeal, isDetailViewPresented: .constant(true))
                .preferredColorScheme(.light)

        }
    }
}

struct NutritionalInfo: View {
    
    var name: String
    var values: String
    
    var body: some View {
        VStack {
            Text(name)
                .fontWeight(.regular)
            
            Text(values)
                .font(.subheadline)
                .foregroundColor(Color(.secondaryLabel))
                .fontWeight(.bold)
        }
    }
}
