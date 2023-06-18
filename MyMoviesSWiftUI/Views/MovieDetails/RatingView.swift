//
//  RatingView.swift
//  MyMoviesSWiftUI
//
//  Created by Karim Amsha on 18.06.2023.
//

import SwiftUI
import CTRating

struct RatingView: View {
    let rating: Double
    
    var body: some View {
        // Rating view
        CTRating(maxRating: 5,
                 currentRating: .constant(Int(rating)),
                 width: 20,
                 color: UIColor(.yellowffcd3c()),
                 openSFSymbol: "star",
                 fillSFSymbol: "star.fill")
    }
}
