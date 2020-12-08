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
                    
                    TextField("First name", text: $model.user.firstName)
                        .disableAutocorrection(true)
                    
                    TextField("Last name", text: $model.user.lastName)
                        .disableAutocorrection(true)
                    
                    TextField("Email address", text: $model.user.emailAddress)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                    
                    DatePicker("Birthdate", selection: $model.user.birthDate, displayedComponents: .date)
            
                }
                
                Section(header: Text("Additional info")) {
                    Toggle("Extra napkins", isOn: $model.user.extraNapkins)
                    Toggle("Frequent refill", isOn: $model.user.frequentRefill)
                } .toggleStyle(SwitchToggleStyle(tint: Colors.primary))
                
                Section() {
                    Button(action: {
                        if model.isFormValid {
                            model.saveUserDetails()
                        } 
                    }, label: {
                        
                        HStack(alignment: .center) {
                            Spacer()
                            Text("Save changes")
                            Spacer()
                        }
                    })
                }
                
                    
            }
            .navigationTitle("Account")
            .foregroundColor(Colors.primary)
            .alert(item: $model.alert) { alert in
                Alert(title: alert.title, message: alert.errorMessage, dismissButton: alert.button)
            }
            .onAppear { model.retrieveUserDetails() }
        }
    }
}

struct WAccountView_Previews: PreviewProvider {
    static var previews: some View {
        WAccountView()
            .preferredColorScheme(.light)
    }
}
