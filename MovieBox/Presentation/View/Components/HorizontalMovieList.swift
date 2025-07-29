//
//  HorizontalMovieList.swift
//  MovieBox
//
//  Created by Bilal Akram on 7/14/25.
//

import SwiftUI

struct  HorizontalMovieList: View {
    var title: String
    var movieList: [Movie]
    var body: some View {
        
        VStack(alignment: .leading){
            Text(title)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading)
                .font(.title2)

            ScrollView(.horizontal) {
                LazyHStack(alignment: .top){
                    ForEach(movieList) { movie in
                        MovieTile(movie: movie)
                            .frame(maxWidth: 200)
                            .cornerRadius(10)
                    }
                }.padding(.horizontal)
                    .frame(maxHeight: 300)
                
                
                
            }
        }
    }
}



#Preview {
    HorizontalMovieList(
        title: "Continue Watching",
        movieList: [
            Movie(id: 0, title: "Inception", imageUrl: ""),
            Movie(id: 1, title: "Tenet", imageUrl: ""),
            Movie(id: 2, title: "F1", imageUrl: "")
        ])
}

#Preview {
    HorizontalMovieList(
        title: "Continue Watching",
        movieList: [
            Movie(id: 0, title: "Inception", imageUrl: ""),
            Movie(id: 1, title: "Tenet", imageUrl: ""),
            Movie(id: 2, title: "F1", imageUrl: "")
        ])
}
