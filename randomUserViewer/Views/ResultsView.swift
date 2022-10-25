//
//  ResultsView.swift
//  randomUserViewer
//
//  Created by NICOLAS  TAUTIVA on 9/09/22.
//

import SwiftUI

struct SingleUserDetails: Identifiable {
    var user_ident = UUID()
    
    var image : String
    var title: String
    var first: String
    var last: String

    var email: String
    var username: String
    var password: String

    var dob: String
    var age: Int
    var nationality: String

    var registration: String
    var yearsRegistered: Int

    var phone: String
    var cellphone: String

    var id: String
    var idValue: String
}


struct ResultsView: View {
    @EnvironmentObject var model: ContentModel
    
    @State var singleUserDetails : SingleUserDetails? = nil
    
    
    var body: some View {
        //
     
        NavigationView {
            VStack (spacing: 20) {

                ScrollView {
                    
                    LazyVStack {
                        
                        ForEach((model.randomUserData?.results)!) {user in
                            
                            HStack {

                                //Create a card with basic data so user can see.... and click to see datails
                                UserCardView(photo: user.picture?.large ?? "No Photo", title: user.name?.title ?? "", first: user.name?.first ?? "", last: user.name?.last ?? "")
                                    .padding(.horizontal)
                                
                            }.onTapGesture {
                                //When tapped, a new object is created.  When the UUID changes, the .sheet will appear.
                                singleUserDetails = SingleUserDetails(
                                                image: user.picture?.large ?? "No Photo",
                                                title: user.name?.title ?? "",
                                                first: user.name?.first ?? "",
                                                last: user.name?.last ?? "",
                                                email: user.email ?? "",
                                                username: user.login?.username ?? "",
                                                password: user.login?.password ?? "",
                                                dob: model.formatDate(date: user.dob?.date ?? ""),
                                                age: user.dob?.age ?? 0,
                                                nationality: model.formatNationality(nationality: user.nat ?? "")  ,
                                                registration: model.formatDate(date: user.registered?.date ?? ""),
                                                yearsRegistered: user.registered?.age ?? 0,
                                                phone: user.phone ?? "",
                                                cellphone: user.cell ?? "",
                                                id: user.id?.name ?? "",
                                                idValue: user.id?.value ?? "")
                                
                            }.sheet(item: $singleUserDetails) { data in
        
                            UserDetailsView(singleUserDetails: data)

                        }
    
                        }
                    }
                }
            }
            .padding(.horizontal)//end of VStack
            .navigationTitle(Text("User Details"))
        }
        

    }
           
        
        //
}


