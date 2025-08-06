//
//  SwiftUIView.swift
//  MovieBox
//
//  Created by Bilal Akram on 7/8/25.
//

import SwiftUI


struct MovieTile :View {
    
    var movie : Movie
    @State private var showDetail = false
    
    let width: CGFloat = 200.0
    var body: some View {
        AsyncImage(
            url: URL(string: movie.imageUrl)
        ){ image in
            image.resizable().scaledToFill()
        } placeholder: {
            Color.gray
        }.aspectRatio(2/3, contentMode: .fit)
            .clipped()
            .cornerRadius(8)
            .fullScreenCover(isPresented: $showDetail){
                MovieDetailsView(movie: movie, onClose:{
                    showDetail = false
                } )
            }
            .onTapGesture {
                showDetail = true
            }
    }
}

#Preview {
    MovieTile(
        movie: Movie.preview
    )
}
