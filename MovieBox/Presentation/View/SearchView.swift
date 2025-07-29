//
//  SearchView.swift
//  MovieBox
//
//  Created by Bilal Akram on 7/24/25.
//

import SwiftUI

struct SearchView: View {
    
    @StateObject private var viewModel: SearchViewModel = DIAssembler.makeSearchViewModel()
    
    var body: some View {
        SearchContent(
            onSubmit: { query in
                viewModel.searchMovie(query: query)
            },
            movieList: viewModel.searchedMovies
        )
        
    }
}

struct SearchContent: View {

    var onSubmit : (String) -> ()
    let movieList: [Movie]
    @State private var searchText : String = ""
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical) {
                LazyVGrid(columns:[ GridItem(.flexible()), GridItem(.flexible())]){
                    ForEach(movieList, id: \.id) { movie in
                        MovieTile(movie: movie)
                            .cornerRadius(10)
                    }
                }.padding(8)
                
            }
            .navigationTitle(
                "Search"
            )
        }
        .searchable(
            text: $searchText
        )
        .onSubmit(of: .search) {
            onSubmit(searchText)
        }
    }
}


#Preview {
    SearchContent(onSubmit: {_ in },
        movieList: [
        Movie(id: 0, title: "Inception", imageUrl: "https://www.vintagemovieposters.co.uk/wp-content/uploads/2020/01/IMG_2891.jpeg"),
        Movie(id: 1, title: "Tenet", imageUrl: "https://m.media-amazon.com/images/M/MV5BZTYwYjJhNzYtY2ZiZS00ZmYxLWJkZjctYjRlNGIxYjI3ZTU0XkEyXkFqcGc@._V1_FMjpg_UX1000_.jpg"),
        Movie(id: 2, title: "F1", imageUrl:
                "https://www.vintagemovieposters.co.uk/wp-content/uploads/2020/01/IMG_2891.jpeg"),
        Movie(id: 3, title: "Inception", imageUrl: "https://www.vintagemovieposters.co.uk/wp-content/uploads/2020/01/IMG_2891.jpeg"),
        Movie(id: 4, title: "Tenet", imageUrl: "https://www.vintagemovieposters.co.uk/wp-content/uploads/2020/01/IMG_2891.jpeg"),
        Movie(id: 5, title: "F1", imageUrl:
                "https://www.vintagemovieposters.co.uk/wp-content/uploads/2020/01/IMG_2891.jpeg"),
        Movie(id: 6, title: "Inception", imageUrl: "https://www.vintagemovieposters.co.uk/wp-content/uploads/2020/01/IMG_2891.jpeg"),
        Movie(id: 7, title: "Tenet", imageUrl: "https://www.vintagemovieposters.co.uk/wp-content/uploads/2020/01/IMG_2891.jpeg"),
        Movie(id: 8, title: "F1", imageUrl:
                "https://www.vintagemovieposters.co.uk/wp-content/uploads/2020/01/IMG_2891.jpeg")
        
    ]
    )
}
