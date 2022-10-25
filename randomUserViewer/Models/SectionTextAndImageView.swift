//
//  SectionTextAndImageView.swift
//  randomUserViewer
//
//  Created by NICOLAS  TAUTIVA on 15/09/22.
//

import Foundation
import SwiftUI

struct SectionTextAndImage: View {
    
    var name: String
    var image: String
    
    var body: some View {
        HStack{
            Image(systemName: image)
            Text(name)
        }
        .font(.body)
        .foregroundColor(.blue)
        
        
    }
    
}
