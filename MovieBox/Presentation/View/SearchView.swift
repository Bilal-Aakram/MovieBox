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
                  movieList : Movie.previewList
    )
}
