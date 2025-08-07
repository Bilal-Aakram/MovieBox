//
//  MovieDetailsView.swift
//  MovieBox
//
//  Created by Bilal Akram on 7/29/25.
//

import SwiftUI

struct MovieDetailsView: View {
    
    var movie : Movie
    var onClose : () -> ()
    
    @StateObject private var viewModel: WatchlistViewModel = DIAssembler.makeWatchlistViewModel()
    
    var body: some View {
        VStack{
            HStack{
                Spacer()
                Button(action: {viewModel.toggleWatchlist(for: movie)} , label:{
                    Image(systemName: "heart.fill")
                        .font(.system(size: 16))
                        .foregroundStyle(viewModel.checkisInWatchlist(movie: movie) ? .red : .black )
                    
                } )
                .padding(5)
                .background(Circle().fill(.white))
                .padding(.bottom)
                .padding(.trailing)
                
                Button(action:onClose , label: {
                    Image(systemName: "xmark.circle")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                        .foregroundStyle(.white)
                })
                .padding(.bottom)
                .foregroundStyle(.black)
                .padding(.trailing, 30)
                
            }
            AsyncImage(
                url: URL(string: movie.imageUrl)
            ){ image in
                image.resizable().scaledToFit()
            } placeholder: {
                Color.gray
            }
            .padding(.horizontal, 25)
            .aspectRatio(2/3, contentMode: .fit)
            .cornerRadius(8)
            
            
            if let title = movie.title {
                Text(title)
                    .font(.title2.bold())
                    .foregroundStyle(.white)
                    .padding(.top)
                
            }
            VStack{
                if let releaseDate = movie.releaseDate{
                    Text(releaseDate)
                        .foregroundStyle(.white)
                        .font(.subheadline)
                        .padding(.horizontal,25)
                }
                RatingView(rating: movie.voteAverage)
                    .foregroundStyle(.white)
            }
            
            Text(movie.overview)
                .font(.body)
                .foregroundStyle(.white)
                .padding(.horizontal,10)
                .padding(.top, 5)
        }.background(
            AsyncImage(
                url: URL(string: movie.imageUrl)
            ){ image in
                image.resizable().scaledToFill()
            } placeholder: {
                Color.gray
            }.ignoresSafeArea()
                .blur(radius: 100)
        ).onAppear{
            viewModel.fetchWatchlist()
        }
        Spacer()
    }
    
}
#Preview {
    MovieDetailsView(movie:Movie.preview, onClose: {})
}
