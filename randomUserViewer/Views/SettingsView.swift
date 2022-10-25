//
//  SettingsView.swift
//  randomUserViewer
//
//  Created by NICOLAS  TAUTIVA on 8/09/22.
//

import SwiftUI

struct SettingsView: View {
    
    @EnvironmentObject var model: ContentModel
        
    
    @State var variableTODO = true
    //@State var usersToDisplay = 1
    
    
    var body: some View {
        //
     
        Form {
            Section  {
                //Stepper("Users to display: \(model.usersToDisplay)", value: $model.usersToDisplay, in: 1...5000) // Working code
                
                Stepper("Users to display: \(model.usersToDisplay)", value: $model.usersToDisplay, in: 1...5000)
                    .onChange(of: model.usersToDisplay) { newNumberUsersToDisplay in
                        UserDefaults.standard.set(newNumberUsersToDisplay, forKey: "usersToDisplay")
                    }
                
                Toggle(isOn: $model.isPersonalInformationShowing) {
                    Text("Personal information")
                }
                .onChange(of: model.isPersonalInformationShowing) { newValue in
                    UserDefaults.standard.set(newValue, forKey: "isPersonalInformationShowing")
                }
                
                Toggle(isOn: $model.isEmailShowing) {
                    Text("Email")
                }
                .onChange(of: model.isEmailShowing) { newValue in
                    UserDefaults.standard.set(newValue, forKey: "isEmailShowing")
                }
                
                Toggle(isOn: $model.isBirthAndNationShowing) {
                    Text("Birthday & Nationality")
                }
                .onChange(of: model.isBirthAndNationShowing) { newValue in
                    UserDefaults.standard.set(newValue, forKey: "isBirthAndNationShowing")
                }
                
                Toggle(isOn: $model.isRegistrationShowing) {
                    Text("Registration")
                }
                .onChange(of: model.isRegistrationShowing) { newValue in
                    UserDefaults.standard.set(newValue, forKey: "isRegistrationShowing")
                }
                
                Toggle(isOn: $model.isPhoneShowing) {
                    Text("Phone")
                }
                .onChange(of: model.isPhoneShowing) { newValue in
                    UserDefaults.standard.set(newValue, forKey: "isPhoneShowing")
                }
                
                Toggle(isOn: $model.isIDShowing) {
                    Text("ID")
                }
                .onChange(of: model.isIDShowing) { newValue in
                    UserDefaults.standard.set(newValue, forKey: "isIDShowing")
                }
                
            } header: {
              SectionTextAndImage(name: "Information to display", image: "list.bullet")
            } footer: {
                Text("Changes will be automatically saved")
                    .font(.caption)
            }
            .frame(width: 300, alignment: .leading)
        }
        
        //
    }
}
