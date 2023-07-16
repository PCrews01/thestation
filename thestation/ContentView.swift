//
//  ContentView.swift
//  thestation
//
//  Created by Paul Crews on 7/7/23.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Query private var active_user: [User]
    @Environment(\.modelContext) private var context
    @State var selection = 0
//    @State var active_user = dummy_user
    
    var body: some View {
        VStack(content: {
            TabView(selection: $selection,
                    content:  {
                HomeView().tabItem { Text("Home") }.tag(0)
                ShowsView().tabItem { Text("Shows") }.tag(1)
                ExploreView().tabItem { Text("Explore") }.tag(2)
                MyActivityView().tabItem { Text("My Activity") }.tag(3)
                LoginView(user: active_user.first ?? dummy_user).tabItem { Text("Login") }.tag(4)
            })
        }).tint(.red)
    }
}

#Preview {
    ContentView()
    
}
