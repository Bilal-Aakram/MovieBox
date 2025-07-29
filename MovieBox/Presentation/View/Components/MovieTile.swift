//
//  SwiftUIView.swift
//  MovieBox
//
//  Created by Bilal Akram on 7/8/25.
//

import SwiftUI


struct MovieTile :View {
    
    var movie : Movie
    
    let width: CGFloat = 200.0
    var body: some View {
        VStack(alignment : .leading){
            AsyncImage(
                    url: URL(string: movie.imageUrl)
                ){ image in
                    image.resizable().scaledToFill()
                } placeholder: {
                    Color.gray
                }.aspectRatio(2/3, contentMode: .fit)
                    .clipped()
                    

            
            if let title = movie.title {
                Text(title)
                   .font(.title3)
                   .lineLimit(1)
                   .fixedSize(horizontal: false, vertical: true)
                   .multilineTextAlignment(.trailing)
                   .truncationMode(.tail)
            }
        }.cornerRadius(8)
            
           
            
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
