//
//  ContentView.swift
//  SwiftUIApp
//
//  Created by Alexander on 15.09.2021.
//

import SwiftUI
import Combine

// MARK: - Views

struct RootView: View {
    
    @State private var selection = 0
    
    var body: some View {
        
        TabView(selection: $selection) {
            StartView()
                .tabItem {
                    VStack {
                        Image(systemName: "bolt")
                        Text("Start")
                    }
                }
                .tag(0)
            FoodListView()
                .tabItem {
                    VStack {
                        Image(systemName: "heart")
                        Text("Food")
                    }
                }
                .tag(1)
            AboutView()
                .tabItem {
                    VStack {
                        Image(systemName: "star")
                        Text("About")
                    }
                }
                .tag(2)
        }
        
        
    }
}

// MARK: - Views

struct StartView: View {
    var body: some View {
        Text("Start Page")
    }
}

struct AboutView: View {
    
    @State private var showAuthors: Bool = false
    
    var body: some View {
        Button(action: {
            self.showAuthors = true
        }) {
            Text("Show Authors")
        }.betterSheet(isPresented: self.$showAuthors, onDismiss: { print("Authors dismissed") }) {
            AboutAuthorsModal()
        }
    }
}

struct AboutAuthorsModal: View {
    var body: some View {
        Text("😎")
            .font(.largeTitle)
    }
}

//struct RootView_Previews: PreviewProvider {
//    static var previews: some View {
//        RootView()
//    }
//}
