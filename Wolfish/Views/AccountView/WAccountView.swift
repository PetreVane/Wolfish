//
//  WAccountView.swift
//  Wolfish
//
//  Created by Petre Vane on 26/11/2020.
//

import SwiftUI

struct WAccountView: View {
    
    init() { customNavigationBar() }
    @StateObject var model = WAccountViewModel()


    
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Personal info")) {
                    
                    TextField("First name", text: $model.firstName)
                        .disableAutocorrection(true)
                    
                    TextField("Last name", text: $model.lastName)
                        .disableAutocorrection(true)
                    
                    TextField("Email address", text: $model.emailAddress)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                    
                    DatePicker("Birthdate", selection: $model.birthDate, displayedComponents: .date)
            
                }
                
                Section(header: Text("Additional info")) {
                    Toggle("Extra napkins", isOn: $model.extraNapkins)
                    Toggle("Frequent refill", isOn: $model.frequentRefill)
                } .toggleStyle(SwitchToggleStyle(tint: Colors.primary))
                
                Section() {
                    Button(action: {
                        model.printValues()
                    }, label: {
                        
                        HStack(alignment: .center) {
                            Spacer()
                            Text("Save changes")
                            Spacer()
                        }
                    })
                }
                
                    
            }.navigationTitle("Account")
            .foregroundColor(Colors.primary)
        }
    }
}

struct WAccountView_Previews: PreviewProvider {
    static var previews: some View {
        WAccountView()
            .preferredColorScheme(.light)
    }
}
