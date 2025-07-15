//
//  MovieCard.swift
//  MovieBox
//
//  Created by Bilal Akram on 7/15/25.
//


import SwiftUI

struct MovieCard: View {
    var movie: Movie
    var body: some View {
        
        VStack(alignment: .leading)
        {
            AsyncImage(
                url: URL(string: movie.imageUrl)
            ){ image in
                image.resizable(resizingMode: .stretch)
            } placeholder: {
                Color.green
            }
        }
    }
}
#Preview {
    MovieCard(movie: Movie(
        id: 0,
        title: "",
        imageUrl:"https://www.vintagemovieposters.co.uk/wp-content/uploads/2020/01/IMG_2891.jpeg")
    )
    
}
