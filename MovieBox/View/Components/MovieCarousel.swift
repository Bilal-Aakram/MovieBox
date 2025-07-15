//
//  MovieCarousel.swift
//  MovieBox
//
//  Created by Bilal Akram on 7/15/25.
//

import SwiftUI

struct MovieCarousel: View {
    
    var movieList: [Movie]
    
    var body: some View {
        VStack{
            TabView{
                ForEach(movieList) { movie in
                    MovieCard(movie: movie)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .tabViewStyle(PageTabViewStyle())
            .indexViewStyle(.page(backgroundDisplayMode: .always))
        }
    }
}
#Preview {
    MovieCarousel(movieList: [
        Movie(id: 0, title: "", imageUrl: "https://www.vintagemovieposters.co.uk/wp-content/uploads/2020/01/IMG_2891.jpeg"),
        Movie(id: 1, title: "", imageUrl: "https://cdn.prod.website-files.com/6009ec8cda7f305645c9d91b/66a4263d01a185d5ea22eeec_6408f6e7b5811271dc883aa8_batman-min.png"),
        Movie(id: 2, title: "", imageUrl: "https://cdn11.bigcommerce.com/s-ydriczk/images/stencil/1500x1500/products/90301/98769/the-creator-original-movie-poster-one-sheet-final-style-buy-now-at-starstills__81077.1697644483.jpg?c=2"),
  
    ])
}
