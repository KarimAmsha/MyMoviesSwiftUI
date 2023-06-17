//
//  SplashView.swift
//  MyMoviesSWiftUI
//
//  Created by Karim Amsha on 17.06.2023.
//

import SwiftUI

struct SplashView: View {
    var body: some View {
        ZStack {
            Image("ic_logo")
                .resizable()
                .frame(width: UIScreen.main.bounds.width/1.5, height: UIScreen.main.bounds.width/6, alignment: .center)
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
