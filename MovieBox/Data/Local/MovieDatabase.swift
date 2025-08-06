//
//  MovieDataStore.swift
//  MovieBox
//
//  Created by Bilal Akram on 8/5/25.
//

import Foundation
import SwiftData


class MovieDatabase{
    
    static let shared = MovieDatabase()
    
    var container : ModelContainer?
    var context : ModelContext?
    
    
    private init(){
        do{
            container = try ModelContainer(for: Movie.self)
            if let container{
                context = ModelContext(container)
            }
        }catch{
            debugPrint("Error initalizing Data Store", error)
        }
    }
}
