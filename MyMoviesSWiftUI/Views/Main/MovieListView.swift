//
//  MovieListView.swift
//  MyMoviesSWiftUI
//
//  Created by Karim Amsha on 18.06.2023.
//

import SwiftUI
import CTRating

struct MovieListView: View {
    @ObservedObject var movies: MovieViewModel
    
    var body: some View {
        ScrollView {
            VStack(spacing: 8) {
                ForEach(movies.movies, id: \.self) { movie in
                    NavigationLink(destination: MovieDetailsView(movie: movie)) {
                        MovieRowView(movie: movie)
                    }
                }
            }
        }
    }
}

struct MovieListView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView(movies: MovieViewModel())
    }
}

