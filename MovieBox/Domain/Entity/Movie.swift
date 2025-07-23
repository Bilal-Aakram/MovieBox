//
//  Movie.swift
//  MovieBox
//
//  Created by Bilal Akram on 7/8/25.
//

import Foundation

struct Movie : Codable, Identifiable {
    let id: Int
    let title: String?
    let imageUrl: String
    
    func copy(id: Int, imageUrl: String) -> Movie {
        .init(id: id, title: nil, imageUrl: imageUrl)
        }
}


