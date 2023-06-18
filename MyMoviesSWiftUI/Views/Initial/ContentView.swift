//
//  ContentView.swift
//  MyMoviesSWiftUI
//
//  Created by Karim Amsha on 17.06.2023.
//

import SwiftUI

struct ContentView: View {
    @State var isActive: Bool = false

    var body: some View {
        VStack {
            if self.isActive {
                AnyView(
                    withAnimation {
                        // Home View with list of movies
                        HomeView()
                            .transition(.scale)
                    }
                )
            } else {
                // Show spalsh view
                SplashView()
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                withAnimation {
                    // Change the state of 'isActive' to show home view
                    self.isActive = true
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
