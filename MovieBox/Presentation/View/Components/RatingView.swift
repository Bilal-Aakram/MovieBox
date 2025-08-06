//
//  RatingView.swift
//  MovieBox
//
//  Created by Bilal Akram on 8/1/25.
//

import SwiftUI

struct RatingView: View {
    
    var rating : Double
    var body: some View {
        HStack{
            Image(systemName: "star.fill")
                .foregroundStyle(.yellow)
            Text("\(rating, specifier: "%.1f")/10")
                .font(.subheadline)
        }
    }
}

#Preview {
    RatingView(rating: 4)
}
