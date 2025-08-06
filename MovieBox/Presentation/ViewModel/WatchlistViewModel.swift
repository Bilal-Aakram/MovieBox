//
//  WatchlistViewModel.swift
//  MovieBox
//
//  Created by Bilal Akram on 8/5/25.
//

import Foundation
import SwiftData


class WatchlistViewModel : ObservableObject {
    
    let movieRepository : MovieRepository
    @Published var watchlist : [Movie] = []
    
    init(movieRepository: MovieRepository) {
        self.movieRepository = movieRepository
    }
    
   private func addtoWatchlist (movie : Movie) {
        Task{ @MainActor in
            await self.movieRepository.addToWatchlist(movie: movie)
            fetchWatchlist()
        }
    }
    
    private func removeFromWatchlist (movie : Movie) {
        Task{ @MainActor in
            await self.movieRepository.removeFromWatchlist(movie: movie)
            fetchWatchlist()
        }
    }
    
    func toggleWatchlist(for movie: Movie) {
        if checkisInWatchlist(movie: movie){
            removeFromWatchlist(movie: movie)
        }
        else{
            addtoWatchlist(movie: movie)
        }
        
    }
    
    func fetchWatchlist()  {
        Task{ @MainActor in
            self.watchlist = await self.movieRepository.fetchWatchlist() ?? []
        }
    }
    
    func checkisInWatchlist (movie : Movie)-> Bool {
        return watchlist.contains { watchlistMovie in
            watchlistMovie.id == movie.id
        }
    }
    
    
}
