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
                        MainView()
                            .transition(.scale)
                    }
                )
            } else {
                SplashView()
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                withAnimation {
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
