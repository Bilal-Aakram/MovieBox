//
//  WatchlistView.swift
//  MovieBox
//
//  Created by Bilal Akram on 8/6/25.
//

import SwiftUI

struct WatchlistView: View {
    
    @ObservedObject private var viewModel : WatchlistViewModel = DIAssembler.makeWatchlistViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical) {
                LazyVGrid(columns:[ GridItem(.flexible()), GridItem(.flexible())]){
                    ForEach(viewModel.watchlist){movie in
                        MovieTile(movie: movie)
                        
                    }
                }.padding(8)
                
            }
            .navigationTitle("WatchList")
            .onAppear{
                viewModel.fetchWatchlist()
            }
            
        }
        
    }
}

#Preview {
    WatchlistView()
}
