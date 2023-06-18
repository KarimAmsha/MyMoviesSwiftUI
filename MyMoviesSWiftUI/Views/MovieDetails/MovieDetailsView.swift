//
//  MovieDetailsView.swift
//  MyMoviesSWiftUI
//
//  Created by Karim Amsha on 18.06.2023.
//

import SwiftUI

struct MovieDetailsView: View {
    let movie: MovieResult
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        GeometryReader { geometry in
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 20) {
                    AsyncImage(url: movie.posterURL) { phase in
                        switch phase {
                        case .empty:
                            ProgressView()
                        case .success(let image):
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(maxWidth: UIScreen.main.bounds.width)
                        case .failure(let error):
                            Text("Failed to load image: \(error.localizedDescription)")
                        @unknown default:
                            EmptyView()
                        }
                    }

                    VStack(alignment: .leading, spacing: 10) {
                        Text(movie.name)
                            .customFont(weight: .medium, size: 20)
                        
                        RatingView(rating: movie.voteAverage)
                        
                        Text(movie.overview)
                            .customFont(weight: .regular, size: 15)
                            .multilineTextAlignment(.leading)
                    }
                    .padding()
                }
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
            .navigationTitle(MovieDetails)
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    backButton
                }
            }
        }
    }
    
    private var backButton: some View {
        Button(action: {
            presentationMode.wrappedValue.dismiss()
        }) {
            Image(systemName: "chevron.left")
                .foregroundColor(.black)
        }
    }
}
