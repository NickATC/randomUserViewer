//
//  randomUserViewerApp.swift
//  randomUserViewer
//
//  Created by NICOLAS  TAUTIVA on 8/09/22.
//

import SwiftUI

@main
struct randomUserViewerApp: App {
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(ContentModel())
        }
    }
}
