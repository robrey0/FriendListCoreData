//
//  RatingView.swift
//  FriendListCoreData
//
//  Created by NEW on 6/24/22.
//

import SwiftUI

struct RatingView: View {
    @Binding var rating: Int
    
    
    let maxRating = 5
    
    let onImage = Image(systemName: "star.fill")
    
    let colorOff = Color.gray
    let colorOn = Color.yellow
    
    
    
    var body: some View {
        HStack {
            ForEach(0..<maxRating, id: \.self) { number in
                onImage
                    .foregroundColor(number > rating ? colorOff : colorOn)
                    .onTapGesture {
                        rating = number
                    }
            }
        }
    }
}


struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        RatingView(rating: .constant(3))
    }
}
