//
//  UserCardView.swift
//  randomUserViewer
//
//  Created by NICOLAS  TAUTIVA on 24/09/22.
//

import SwiftUI

struct UserCardView: View {
    
    var photo: String
    var title: String
    var first: String
    var last: String
    
    
    var body: some View {
        
        //User card
        
        ZStack {
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius(10)
                .shadow(radius: 5)
                .aspectRatio(CGSize(width: 300, height: 120), contentMode: .fit)
            
            HStack  {
                //Photo
                AsyncImage(url: URL(string: photo), content: { photo in
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
                    //Title
                    Text("Title: \(title)")
                        .font(.subheadline)
                    //First Name
                    Text("First: \(first)")
                        .font(.subheadline)
                    //Last Name
                    Text("Last: \(last)")
                        .font(.subheadline)
                }
                .padding(.leading, 30)
                Spacer()
            }
        }
        .tint(.black)
        
    }
}

