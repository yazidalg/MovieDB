//
//  HomeViewModel.swift
//  MovieDB
//
//  Created by Yazid Al Ghozali on 24/02/24.
//

import Foundation

final class HomeViewModel: ObservableObject {
    private let movieRepository: MovieRepository
    
    @Published var popularMovieList: [Result] = []
    
    init(movieRepository: MovieRepository = DefaultMovieRepository()) {
        self.movieRepository = movieRepository
    }
    
    @MainActor
    func getPopularMovies() async {
        do {
            let data = try await movieRepository.getPopularMovie()
            self.popularMovieList = data.results ?? []
            print(self.popularMovieList.first?.backdropPath ?? "Noting")
        } catch {
            print(String(describing: error))
        }
    }
}
