//
//  MyMoviesSWiftUIApp.swift
//  MyMoviesSWiftUI
//
//  Created by Karim Amsha on 17.06.2023.
//

import SwiftUI

@main
struct MyMoviesSWiftUIApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .preferredColorScheme(.light)
        }
    }
}
