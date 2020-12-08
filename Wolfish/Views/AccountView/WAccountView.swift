//
//  WAccountView.swift
//  Wolfish
//
//  Created by Petre Vane on 26/11/2020.
//

import SwiftUI

struct WAccountView: View {
    
    init() { customNavigationBar() }
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var emailAddress = ""
    @State private var birthDate = Date()
    @State private var extraNapkins = false
    @State private var frequentRefill = false

    
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Personal info")) {
                    
                    TextField("First name", text: $firstName)
                        .disableAutocorrection(true)
                    
                    TextField("Last name", text: $lastName)
                        .disableAutocorrection(true)
                    
                    TextField("Email address", text: $emailAddress)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                    
                    DatePicker("Birthdate", selection: $birthDate, displayedComponents: .date)
            
                }
                
                Section(header: Text("Additional info")) {
                    Toggle("Extra napkins", isOn: $extraNapkins)
                    Toggle("Frequent refill", isOn: $frequentRefill)
                } .toggleStyle(SwitchToggleStyle(tint: Colors.primary))
                
                Section() {
                    Button(action: {
                        print("Values saved")
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
