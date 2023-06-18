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
        LoadingView(isShowing: $movieViewModel.isLoading) {
            NavigationView {
                // A view displaying a list of movies, with a navigation bar styled differently for iPad and iPhone.
                MovieListView(viewModel: movieViewModel)
                    .navigationBarTitle(HomeTitle)
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationBarColor(titleColor: .black)
                    .modify(if: UIDevice.current.userInterfaceIdiom == .pad, then: IPadNavigationViewStyle(), else: IPhoneNavigationViewStyle())
            }
            .navigationViewStyle(.stack)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
