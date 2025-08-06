//
//  ContentView.swift
//  MovieBox
//
//  Created by Bilal Akram on 7/8/25.
//

import SwiftUI
import SwiftData

struct MovieExploreView: View {
    
    @StateObject private var viewModel: ExploreViewModel = DIAssembler.makeMovieListViewModel()
    
    var body: some View {
        MovieExploreContent(
            isLoading : viewModel.isLoading,
            isError: viewModel.isError,
            popularMovies: viewModel.popularMovies,
            topRatedMovies: viewModel.topRatedMovies,
            upcomingMovies: viewModel.upcomingMovies,
            onRefresh: {
                viewModel
                    .tryAgain()
            }
        )
    }
    
}

private struct MovieExploreContent: View {
    
    var isLoading : Bool
    var isError : Bool
    var popularMovies: [Movie]
    var topRatedMovies: [Movie]
    var upcomingMovies: [Movie]
    var onRefresh : () -> ()
    
    var body: some View {
        if isLoading  {
            ProgressView()
                .progressViewStyle(
                    CircularProgressViewStyle (
                        tint: .black
                    )
                )
                .frame(
                    alignment: .center
                )
        }else if isError{
            Text(
                "Something went wrong. Please try again!"
            )
            Button(
                "Try again"
            ) {
                onRefresh()
            }
        }
        else{
            ScrollView {
                VStack {
                    MovieCarousel(
                        movieList: popularMovies
                    )
                    .aspectRatio(
                        2/3,
                        contentMode: .fit
                    )
                    
                    HorizontalMovieList(
                        title: "Top Rated Movies",
                        movieList: topRatedMovies
                    )
                    
                    HorizontalMovieList(
                        title: "Upcoming Movies",
                        movieList: upcomingMovies
                    )
                }
            }
        }
    }
    
    }

#Preview {
    let movies =  Movie.previewList
    
    MovieExploreContent(
        isLoading: false,
        isError: false,
        popularMovies:movies,
        topRatedMovies: movies,
        upcomingMovies: movies,
        onRefresh:{
        }
    )
}


#Preview {
    MovieExploreContent(
        isLoading: true,
        isError: false,
        popularMovies: [],
        topRatedMovies: [],
        upcomingMovies: [],
        onRefresh: {
        }
    )
}

#Preview {
    MovieExploreContent(
        isLoading: false,
        isError: true,
        popularMovies: [],
        topRatedMovies: [],
        upcomingMovies: [],
        onRefresh: {
        }
    )
}
