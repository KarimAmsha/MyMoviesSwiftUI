//
//  NavigationBarModifier.swift
//  MyMoviesSWiftUI
//
//  Created by Karim Amsha on 18.06.2023.
//

import SwiftUI

struct NavigationBarModifier: ViewModifier {

    var backgroundImage: UIImage?
    var titleColor: UIColor?

    init(titleColor: UIColor?) {
        let textAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black, NSAttributedString.Key.font: UIFont(name: FontWeight.regular.rawValue, size: 17)!]
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [Color.primary().cgColor ?? UIColor.white.cgColor, Color.lightPrimary().cgColor ?? UIColor.white.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        gradientLayer.frame = CGRect(x: 0, y: 0, width: 1, height: 1) // Set the frame of the gradient layer



        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        let renderer = UIGraphicsImageRenderer(bounds: gradientLayer.bounds)
        let backgroundImage = renderer.image { rendererContext in
            gradientLayer.render(in: rendererContext.cgContext)
        }
        self.backgroundImage = backgroundImage
        appearance.backgroundImage = backgroundImage
        appearance.titleTextAttributes = textAttributes
        appearance.largeTitleTextAttributes = textAttributes
        appearance.shadowImage = UIImage()
        appearance.shadowColor = .clear

        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        
        UINavigationBar.appearance().tintColor = titleColor ?? .black
        UINavigationBar.appearance().barTintColor = titleColor ?? .black
    }

    func body(content: Content) -> some View {
        ZStack{
            content
            VStack {
                GeometryReader { geometry in
                    Image(uiImage: backgroundImage ?? UIImage())
                        .frame(height: geometry.safeAreaInsets.top)
                        .edgesIgnoringSafeArea(.top)
                    Spacer()
                }
            }
        }
    }
}

extension View {

    func navigationBarColor(titleColor: UIColor?) -> some View {
        self.modifier(NavigationBarModifier(titleColor: titleColor))
    }

}

