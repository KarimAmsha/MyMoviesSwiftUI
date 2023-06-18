//
//  MovieListView.swift
//  MyMoviesSWiftUI
//
//  Created by Karim Amsha on 18.06.2023.
//

import SwiftUI
import CTRating
import PopupView

struct MovieListView: View {
    @ObservedObject var viewModel: MovieViewModel

    var body: some View {
        // List of movies
        ScrollView(showsIndicators: false) {
            VStack(spacing: 8) {
                ForEach(viewModel.movies, id: \.self) { movie in
                    NavigationLink(destination: MovieDetailsView(movie: movie)) {
                        MovieRowView(movie: movie)
                    }
                }
            }
        }
        .popup(isPresented: $viewModel.showAlert) {
            AlertView(message: $viewModel.message)
        } customize: {
            $0
                .type(.floater())
                .position(.top)
                .animation(.spring())
                .closeOnTapOutside(true)
                .backgroundColor(.black.opacity(0.5))
                .autohideIn(5)
        }
        .onAppear {
            viewModel.fetchPopularMovies()
        }
    }
}

struct MovieListView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView(viewModel: MovieViewModel())
    }
}

