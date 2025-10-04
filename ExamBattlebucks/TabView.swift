//
//  TabView.swift
//  ExamBattlebucks
//
//  Created by selegic mac 01 on 03/10/25.
//

import SwiftUI
import CoreData

enum Tab: Hashable {
    case home, favorites
}

struct TabView: View {
    let persistenceController = PersistenceController.shared
    @State private var selection: Tab = .home
    
    var body: some View {
        SwiftUI.TabView(selection: $selection) {
            NavigationStack {
                ContentView()
                    .environment(\.managedObjectContext, persistenceController.container.viewContext)
            }
            .tabItem {
                Label("Home", systemImage: selection == .home ? "house.fill" : "house")
            }
            .tag(Tab.home)
            
            
            NavigationStack {
                FavoritesView()
                    .environment(\.managedObjectContext, persistenceController.container.viewContext)
            }
            .tabItem {
                Label("Favorites", systemImage: selection == .favorites ? "heart.fill" : "heart")
            }
            .tag(Tab.favorites)
        }
    }
}
