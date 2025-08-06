//
//  MovieCarousel.swift
//  MovieBox
//
//  Created by Bilal Akram on 7/15/25.
//

import SwiftUI

struct MovieCarousel: View {
    
    var movieList: [Movie]
    @State private var showDetail = false
    var body: some View {
        VStack{
            TabView{
                ForEach(movieList) { movie in
                    MovieCard(imageUrl: movie.imageUrl)
                        .fullScreenCover(isPresented: $showDetail) {
                            MovieDetailsView(movie: movie, onClose: {
                                showDetail = false
                            })
                        }   
                }
                .onTapGesture {
                    showDetail = true
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .tabViewStyle(PageTabViewStyle())
            .indexViewStyle(.page(backgroundDisplayMode: .always))
        }
    }
}

private struct MovieCard: View {
    var imageUrl: String
    var body: some View {
        AsyncImage(
            url: URL(string: imageUrl)
        ){ image in
            image.resizable(resizingMode: .stretch)
        } placeholder: {
            Color.gray
        }
    }
}

#Preview {
    MovieCard(imageUrl:"https://www.vintagemovieposters.co.uk/wp-content/uploads/2020/01/IMG_2891.jpeg")
    
    
}

#Preview {
    MovieCarousel(movieList: Movie.previewList)
}
