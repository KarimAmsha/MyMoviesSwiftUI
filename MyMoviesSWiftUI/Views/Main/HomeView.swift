//
//  HomeView.swift
//  MyMoviesSWiftUI
//
//  Created by Karim Amsha on 17.06.2023.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var movieViewModel = MovieViewModel()
    
    var body: some View {
        NavigationView {
            MovieListView(movies: movieViewModel)
                .onAppear {
                    movieViewModel.fetchPopularMovies()
                }
                .navigationBarTitle(HomeTitle)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
