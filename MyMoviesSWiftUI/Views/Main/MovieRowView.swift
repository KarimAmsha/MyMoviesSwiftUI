//
//  MovieRowView.swift
//  MyMoviesSWiftUI
//
//  Created by Karim Amsha on 18.06.2023.
//

import SwiftUI
import CTRating

struct MovieRowView: View {
    let movie: MovieResult
    
    var body: some View {
        HStack(spacing: 16) {
            // Movie poster image view
            AsyncImage(url: movie.posterURL) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 80, height: 120)
                    .cornerRadius(8)
            } placeholder: {
                ProgressView()
                    .frame(width: 80, height: 120)
            }
            
            VStack(alignment: .leading, spacing: 8) {
                // Movie title label
                Text(movie.name)
                    .customFont(weight: .medium, size: 15)
                    .foregroundColor(.black)
                
                // Rating view
                CTRating(maxRating: 5,
                         currentRating: .constant(Int(movie.voteAverage)),
                         width: 20,
                         color: UIColor(.yellowffcd3c()),
                         openSFSymbol: "star",
                         fillSFSymbol: "star.fill")
            }
            
            Spacer()
        }
        .padding(8)
    }
}

struct MovieRowView_Previews: PreviewProvider {
    static var previews: some View {
        MovieRowView(movie: MovieResult(backdropPath: "", firstAirDate: "", genreIds: [], id: 0, name: "", originCountry: [], originalLanguage: "", originalName: "", overview: "", popularity: 0.0, posterPath: "", voteAverage: 0.0, voteCount: 0))
    }
}

