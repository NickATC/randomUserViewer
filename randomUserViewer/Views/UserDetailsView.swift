//
//  UserDetailsView.swift
//  randomUserViewer
//
//  Created by NICOLAS  TAUTIVA on 24/09/22.
//

import SwiftUI

struct UserDetailsView: View {
    
    @Environment(\.dismiss) var dismiss  //To close the .sheet
    @EnvironmentObject var model: ContentModel
    
    @State var singleUserDetails: SingleUserDetails!

    var body: some View {
        //
        Form {

            //Personal info
            if model.isPersonalInformationShowing { //TODO:  Use this way to control if the section is visible or not based on the Settings options.
                Section  {
                    HStack{
                        AsyncImage(url: URL(string: singleUserDetails.image), content: { photo in
                            photo
                            .resizable()
                            .frame(width: 100, height: 100)
                            .clipShape(Circle())   //circle shape!
                            .padding(.leading, 30)
                        }, placeholder: { //If image doesnt load, this will show:
                            Image(systemName: "person.fill.checkmark")
                            .resizable()
                            .frame(width: 100, height: 100)
                            .clipShape(Circle())   //circle shape!
                            .padding(.leading, 30)
                        })
                        VStack (alignment: .leading) {
                            Text("Title :   \(singleUserDetails.title)")
                                .font(.subheadline)
                            Text("First :   \(singleUserDetails.first)")
                                .font(.subheadline)
                            Text("Last:  \(singleUserDetails.last)")
                                .font(.subheadline)
                        }
                    }
                } header: {
                    SectionTextAndImage(name: "Personal Information", image: "person.text.rectangle")
                }
                .frame(width: 300, alignment: .leading)
                }


                //email and login data
            if model.isEmailShowing {
                Section  {
                        Text("Email :   \(singleUserDetails.email)")
                            .font(.footnote)
                        Text("Username :   \(singleUserDetails.username)")
                            .font(.footnote)
                        Text("Password :   \(singleUserDetails.password)")
                            .font(.footnote)
                    } header: {
                        SectionTextAndImage(name: "Email", image: "envelope.badge")
                    }
                .frame(width: 200, alignment: .leading)
            }

                
                //Date of birth and nationality
            if model.isBirthAndNationShowing {
                Section  {
                        //TODO:  Format this date.  use the func formatData() in model.
                        Text("Birthday :   \( singleUserDetails.dob)")
                            .font(.footnote)
                        Text("Age :   \(singleUserDetails.age)")
                            .font(.footnote)
                        Text("Nationality :   \(singleUserDetails.nationality)")
                            .font(.footnote)
                    }header: {
                        SectionTextAndImage(name: "Birthday & Nationality", image: "person")
                    }
                .frame(width: 300, alignment: .leading)
            }

                
                //Date of registration
            if model.isRegistrationShowing {
                Section  {
                        Text("Date of Registration :   \(singleUserDetails.registration)")
                            .font(.footnote)
                        Text("Years registered :   \(singleUserDetails.yearsRegistered)")
                            .font(.footnote)
                    } header: {
                        SectionTextAndImage(name: "Registration", image: "person.badge.plus")
                }
            }
                
                //phone and cell data
            if model.isPhoneShowing {
                Section  {
                        Text("Phone :   \(singleUserDetails.phone)")
                            .font(.footnote)
                        Text("Cellphone :   \(singleUserDetails.cellphone)")
                            .font(.footnote)
                    } header: {
                        SectionTextAndImage(name: "Phone", image: "phone")
                }
            }

                //id data
            if model.isIDShowing {
                Section  {
                        Text("ID :   \(singleUserDetails.id)")
                            .font(.footnote)
                        Text("ID Value :   \(singleUserDetails.idValue)")
                            .font(.footnote)
                    } header: {
                        SectionTextAndImage(name: "ID", image: "person.crop.rectangle")
                }
            }
            }
        
        Button {
            dismiss()
        } label: {
            Text("Close")
        }

        //
    }
}

