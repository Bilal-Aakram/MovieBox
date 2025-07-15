//
//  SwiftUIView.swift
//  MovieBox
//
//  Created by Bilal Akram on 7/8/25.
//

import SwiftUI


struct MovieTile :View {
    
    var movie : Movie
    
    var body: some View {
        VStack(alignment: .leading){
            AsyncImage(
                url: URL(string: movie.imageUrl)
            ){ image in
                image.resizable(resizingMode: .stretch)
            } placeholder: {
                Color.green
            }
            
            if let title = movie.title {
                Text(title)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.title3)
            }
            
        }.cornerRadius(8)
            .aspectRatio(2/3, contentMode: .fit)
            .frame(maxWidth: 200, maxHeight: 300)
    }
}

#Preview {
    MovieTile(
        movie: Movie(
            id: 0,
            title: "Joker",
            imageUrl: "https://www.vintagemovieposters.co.uk/wp-content/uploads/2020/01/IMG_2891.jpeg"
        )
    )
}

#Preview {
    MovieTile(
        movie: Movie(
            id: 0,
            title: nil,
            imageUrl: "https://www.vintagemovieposters.co.uk/wp-content/uploads/2020/01/IMG_2891.jpeg"
        )
    )
}
