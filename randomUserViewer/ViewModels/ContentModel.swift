//
//  ContentModel.swift
//  randomUserViewer
//
//  Created by NICOLAS  TAUTIVA on 8/09/22.
//

import Foundation
import SwiftUI

class ContentModel: ObservableObject {
    
    @EnvironmentObject var model: ContentModel
    
    @Published var randomUserData: RandomUserData? // The list where all user data will be kept.  This info comes from the API response.
        
    @Published var isValidUser: Bool? = false //To track if info is loaded correctly
    @Published var usersCount: Int? = 0   //number of users loaded
    
    //Values that can be modified via SettingsView:
    @Published var usersToDisplay: Int = UserDefaults.standard.integer(forKey: "usersToDisplay")
    @Published var isPersonalInformationShowing: Bool = UserDefaults.standard.bool(forKey: "isPersonalInformationShowing")
    @Published var isEmailShowing: Bool = UserDefaults.standard.bool(forKey: "isEmailShowing")
    @Published var isBirthAndNationShowing: Bool = UserDefaults.standard.bool(forKey: "isBirthAndNationShowing")
    @Published var isRegistrationShowing: Bool = UserDefaults.standard.bool(forKey: "isRegistrationShowing")
    @Published var isPhoneShowing: Bool = UserDefaults.standard.bool(forKey: "isPhoneShowing")
    @Published var isIDShowing: Bool = UserDefaults.standard.bool(forKey: "isIDShowing")
    //
    
    func createRandomUser(){
        //Makes new API call and creates user
        
        //Steps to follow:
        //Create URL
        //Create URL request
        //Get URL session
        //Create dataTask
        //Start the DataTask
     
        //Create URL
        let urlString = Constants.apiUrl + String(usersToDisplay)
        let url = URL(string: urlString)

        if let url = url {
            //Create URL request
            var request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
            request.httpMethod = "GET"

            //Get URL session
            let session = URLSession.shared
            
            //Create dataTask
            let dataTask = session.dataTask(with: request) { data, response, error in
                
                //Check that there isn't an error
                if error == nil {
                    //print(response!)
                    
                    do{
                    //Parse JSON
                        let decoder = JSONDecoder()
                        let result = try decoder.decode(RandomUserData.self, from: data!)

                        DispatchQueue.main.async {
                            //Assign to the appropriate property
                            
                            self.randomUserData = result
                            self.usersCount = result.results?.count
                            self.isValidUser = result.info?.seed != nil ? true : false
                        }
                 }
                    catch {
                        print(error)
                    }
                }
            }
            
            //Start the DataTask
            dataTask.resume()
        }
        
    }

    func resetValues(){
        //Resets values momentarily
        
        //reset dataStatus
        self.isValidUser = false
        
        //reset usersCount
        self.usersCount = 0
    }
    
    func formatDate(date: String) -> String {
        //Takes a String from API and returns a \(month) \(day) \(year) String
            
        let year = date.prefix(4)
        let day = date.dropFirst(8).prefix(2)
        
        let month: String
        
        let monthSelected = date.dropFirst(5).prefix(2)
        
        switch monthSelected {
            case "01"  :
                month = "January"
            case "02"  :
                month = "February"
            case "03"  :
                month = "March"
            case "04"  :
              month = "April"
            case "05"  :
                month = "May"
            case "06"  :
                month = "June"
            case "07"  :
              month = "July"
            case "08"  :
                month = "August"
            case "09"  :
                month = "September"
            case "10"  :
              month = "October"
            case "11"  :
                month = "November"
            case "12"  :
                month = "December"
            default:
                month =  "No month!"
        }

        return "\(month) \(day) \(year)" // (month) (day) (year)
    }

    func formatNationality(nationality: String) -> String {
        //Takes 2 letters from the API and returns the full name of the country
        var nationality = nationality
        
        
        switch nationality {
        case "AU":
            nationality = "Autralian"
        case "BR":
            nationality = "Brazilean"
        case "CA":
            nationality = "Canadian"
        case "CH":
            nationality = "Chilean"
        case "DE":
            nationality = "Denmark"
        case "DK":
            nationality = "Denmark"
        case "ES":
            nationality = "Estonian"
        case "FI":
            nationality = "Finnish"
        case "FR":
            nationality = "French"
        case "BG":
            nationality = "British"
        case "IE":
            nationality = "Indian2"
        case "IR":
            nationality = "Irish"
        case "IN":
            nationality = "Indian"
        case "MX":
            nationality = "Mexican"
        case "NL":
            nationality = "New Land"
        case "NO":
            nationality = "New Orleans"
        case "NZ":
            nationality = "New Zealand"
        case "RS":
            nationality = "Russian"
        case "TR":
            nationality = "Triumph"
        case "UA":
            nationality = "Union American"
        case "US":
            nationality = "American"
        default:
            nationality = "\(nationality)"
        }
        
        return nationality
    }

    func assignDefaultSettings() {
        //Code to show default values when app is first started
        if UserDefaults.standard.integer(forKey: "usersToDisplay") == 0 {
            UserDefaults.standard.set(3, forKey: "usersToDisplay")
            UserDefaults.standard.set(true, forKey: "isPersonalInformationShowing")
            UserDefaults.standard.set(true, forKey: "isEmailShowing")
            UserDefaults.standard.set(true, forKey: "isBirthAndNationShowing")
            UserDefaults.standard.set(true, forKey: "isRegistrationShowing")
            UserDefaults.standard.set(true, forKey: "isPhoneShowing")
            UserDefaults.standard.set(true, forKey: "isIDShowing")
        }
    }
}



