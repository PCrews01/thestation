//
//  thestationApp.swift
//  thestation
//
//  Created by Paul Crews on 7/7/23.
//

import SwiftUI
import SwiftData

@main
struct thestationApp: App {
    
        let container =  try! ModelContainer(for: User.self)
    
    var body: some Scene {
        WindowGroup {
            ContentView().background(Color.gray)
                .modelContainer(for: User.self)
        }
    }
}
