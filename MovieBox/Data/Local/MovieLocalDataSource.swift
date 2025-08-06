//
//  MovieLocalDataBase.swift
//  MovieBox
//
//  Created by Bilal Akram on 8/5/25.
//

import Foundation
import SwiftData


class MovieLocalDataSource{
    private let movieDatabase : MovieDatabase
    
    init(movieDatabase: MovieDatabase) {
        self.movieDatabase = movieDatabase
    }
    
    func insert(movie : Movie) async{
        self.movieDatabase.context?.insert(movie)
    }
    
    func delete (movie : Movie) async{
        self.movieDatabase.context?.delete(movie)
    }
    
    func fetchAll() async -> [Movie]?  {
        do{
            return try self.movieDatabase.context?.fetch(FetchDescriptor<Movie>())
        }catch{
            fatalError(error.localizedDescription)
        }
    }
}
