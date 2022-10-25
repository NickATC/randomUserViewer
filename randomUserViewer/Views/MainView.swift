//
//  ContentView.swift
//  randomUserViewer
//
//  Created by NICOLAS  TAUTIVA on 8/09/22.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var model: ContentModel
    
    
    var dataStatusString: String {
        return model.isValidUser! ? "Valid data!" : "No data!"
    }
    
    var body: some View {
        //
        TabView {
            //This is the data on first Screen
            
            NavigationView{
                
                VStack{
                    Text("Welcome to")
                        .font(.largeTitle)
                    Text("Random User Viewer!")
                        .font(.largeTitle)
                    
                    Spacer()
                    
                    Button {
                        model.resetValues()
                        model.assignDefaultSettings()
                        model.createRandomUser()
                    } label: {
                        Text("Download random user data!")
                    }
                    .padding()
                    .background(.blue)
                    .cornerRadius(10)
                    .foregroundColor(.white)
                    
                    //Card status indicators
                    GroupBox  {
                        Text("Data Status :   \(dataStatusString)")
                            .font(.footnote)
                        Text("People loaded:  \(model.usersCount!)")
                            .font(.footnote)
                    } label: {
                        Text("Results :")
                            .font(.title3)
                            .foregroundColor(.gray)
                    }
                    //.padding(.horizontal)
                    .frame(width: 200)

                    Spacer()

                    NavigationLink(destination: ResultsView()) {
                        Button {
                            // TODO:  Check if this button can be changed...
                        } label: {
                            HStack{
                                Text("See user details")
                                Image(systemName: "person.fill")
                            }
                        }
                        .padding()
                        .background(dataStatusString == "No data!" ? .gray : .green)
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .disabled(dataStatusString == "No data!" ? false : true)
                    }
                    
                    Spacer()

                }
                .onAppear(){
                    model.assignDefaultSettings()
                }
            }
            
            
            .tabItem {
                Image(systemName: "person.circle")
                Text("User data")
            }
            .badge(model.usersCount ?? 0)
            
            
            //This is the data on Settings Screen
            SettingsView()

            .tabItem {
                Image(systemName: "gearshape")
                Text("Settings")
            }
        
        
        } //End of TabView
    
        //
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(ContentModel())
    }
}
