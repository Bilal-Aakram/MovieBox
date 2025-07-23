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
                Color.gray
            }
            .frame(maxWidth: 200, maxHeight: 300)
            
            if let title = movie.title {
                Text(title)
                   
                    .font(.title3)
            }
            
        }.cornerRadius(8)
            .frame(maxWidth: 200, maxHeight: 600)
           
            
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
