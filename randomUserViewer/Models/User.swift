//
//  User.swift
//  randomUserViewer
//
//  Created by NICOLAS  TAUTIVA on 8/09/22.
//

import Foundation

class RandomUserData: Decodable, Identifiable, ObservableObject {
    var results: [User]?  //If the result is within []
    var info: Info? //If the result is within {}
}

class User: Decodable, Identifiable, ObservableObject {
    var gender: String?
    var name: Name?
    //var location: Location?  //Check if the error in the website has been corrected before activating this option.
    var email: String?
    var login: Login?
    var dob: Dob?
    var registered: Registered?
    var phone: String?
    var cell: String?
    var id: Id?
    var picture: Picture?
    var nat: String?
}

class Info: Decodable, Identifiable, ObservableObject{
    
    var seed: String?
    var results: Int?
    var page: Int?
    var version: String?
}

class Name: Decodable, Identifiable, ObservableObject {
    var title: String?
    var first: String?
    var last: String?
}

//class Location: Decodable, Identifiable, ObservableObject {
//    var street: Street?
//    var city: String?
//    var state: String?
//    var country: String?
//    var postcode: String?
//    var coordinates: Coordinates?
//    var timezone: TimeZone?
//}

//class Street: Decodable, Identifiable, ObservableObject {
//    var number: Int?
//    var name: String?
//}
//
//class Coordinates: Decodable, Identifiable, ObservableObject {
//    var latitude: String?
//    var longitude: String?
//}
//
//class TimeZone: Decodable, Identifiable, ObservableObject {
//    var offset: String?
//    var description: String?
//}

class Login: Decodable, Identifiable, ObservableObject {
    var uuid: String?
    var username: String?
    var password: String?
    var salt: String?
    var md5: String?
    var shal: String?
    var sha256: String?
}

class Dob: Decodable, Identifiable, ObservableObject {
    var date: String?
    var age: Int?
}

class Registered: Decodable, Identifiable, ObservableObject {
    var date: String?
    var age: Int?
}

class Id: Decodable, Identifiable, ObservableObject {
    var name: String?
    var value: String?
}

class Picture: Decodable, Identifiable, ObservableObject {
    var large: String?
    var medium: String?
    var thumbnail: String?
}


// Example of response from https://randomuser.me/api/

//{
//  "results": [
//    {
//      "gender": "female",
//      "name": {
//        "title": "Miss",
//        "first": "Jennie",
//        "last": "Nichols"
//      },
//      "location": {
//        "street": {
//          "number": 8929,
//          "name": "Valwood Pkwy",
//        },
//        "city": "Billings",
//        "state": "Michigan",
//        "country": "United States",
//        "postcode": "63104",
//        "coordinates": {
//          "latitude": "-69.8246",
//          "longitude": "134.8719"
//        },
//        "timezone": {
//          "offset": "+9:30",
//          "description": "Adelaide, Darwin"
//        }
//      },
//      "email": "jennie.nichols@example.com",
//      "login": {
//        "uuid": "7a0eed16-9430-4d68-901f-c0d4c1c3bf00",
//        "username": "yellowpeacock117",
//        "password": "addison",
//        "salt": "sld1yGtd",
//        "md5": "ab54ac4c0be9480ae8fa5e9e2a5196a3",
//        "sha1": "edcf2ce613cbdea349133c52dc2f3b83168dc51b",
//        "sha256": "48df5229235ada28389b91e60a935e4f9b73eb4bdb855ef9258a1751f10bdc5d"
//      },
//      "dob": {
//        "date": "1992-03-08T15:13:16.688Z",
//        "age": 30
//      },
//      "registered": {
//        "date": "2007-07-09T05:51:59.390Z",
//        "age": 14
//      },
//      "phone": "(272) 790-0888",
//      "cell": "(489) 330-2385",
//      "id": {
//        "name": "SSN",
//        "value": "405-88-3636"
//      },
//      "picture": {
//        "large": "https://randomuser.me/api/portraits/men/75.jpg",
//        "medium": "https://randomuser.me/api/portraits/med/men/75.jpg",
//        "thumbnail": "https://randomuser.me/api/portraits/thumb/men/75.jpg"
//      },
//      "nat": "US"
//    }
//  ],
//  "info": {
//    "seed": "56d27f4a53bd5441",
//    "results": 1,
//    "page": 1,
//    "version": "1.4"
//  }
//}
