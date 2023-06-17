//
//  MovieDetailsView.swift
//  MyMoviesSWiftUI
//
//  Created by Karim Amsha on 18.06.2023.
//

import SwiftUI

struct MovieDetailsView: View {
    let movie: MovieResult
    
    var body: some View {
        VStack {
            Text(movie.name)
                .font(.title)
            Text(movie.overview)
                .font(.body)
                .multilineTextAlignment(.leading)
                .padding()
            Spacer()
        }
    }
}

