//
//  MovieViewModel.swift
//  MyMoviesSWiftUI
//
//  Created by Karim Amsha on 17.06.2023.
//

import Foundation
import RxSwift

/// The MovieViewModel class is responsible for fetching movie data from the API and managing the state of the movie list.
class MovieViewModel: ObservableObject {

    /// A DisposeBag instance to hold disposable resources.
    private let disposeBag = DisposeBag()

    /// A shared instance of the APIClient to make API requests.
    private let apiClient = APIClient.shared

    /// A Published property that will emit an array of MovieResult items whenever the movie list is updated.
    @Published var movies: [MovieResult] = []
    @Published var isLoading: Bool = false
    @Published var message = ""
    @Published var showAlert = false

    /// Fetches popular movies from the API and updates the `movies` property with the results.
    ///
    /// This function will make an API request to the popular movies endpoint, parse the response, and update the
    /// `movies` property with the new movie list. In case of an error, it will print the error message.
    func fetchPopularMovies() {
        isLoading = true

        // Define the API endpoint for fetching popular movies
        let popularMoviesEndpoint = APIEndpoint.popularMovies(page: 1)

        // Make a request to the API endpoint and handle the response
        apiClient.request(endpoint: popularMoviesEndpoint)
            .map { (response: Movie) -> [MovieResult] in
                // Extract and return the movie results from the response data
                return response.results
            }
            .subscribe(onNext: { [weak self] response in
                // Update the movies property with the response data
                self?.movies = response
                self?.isLoading = false
            }, onError: { error in
                // Handle the error by printing it
                print(error)
                self.message = error.localizedDescription
                self.showAlert.toggle()
                self.isLoading = false
            })
            .disposed(by: disposeBag)
    }
}
