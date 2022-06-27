//
//  DetailView.swift
//  FriendListCoreData
//
//  Created by NEW on 6/25/22.
//

import SwiftUI

struct DetailView: View {
    
    let friend: Friend
    
    var body: some View {
        ScrollView {
            ZStack(alignment: .bottomTrailing) {
                Image(friend.vibe ?? "Chill")
                    .resizable()
                    .scaledToFit()
                
                Text(friend.vibe ?? "Chill")
                    .font(.caption)
                    .fontWeight(.black)
                    .padding(8)
                    .foregroundColor(.white)
                    .background(.black.opacity(0.75))
                    .clipShape(Capsule())
                    .offset(x: -5, y: -5)
            }
            
            Text(String(friend.age))
                .font(.title)
                .foregroundColor(.secondary)
            
            Text(friend.review ?? "")
                .foregroundColor(.secondary)
                .padding()
            
            RatingView(rating: .constant(Int(friend.rating)))
                .font(.largeTitle)
        }
        .navigationTitle(friend.name ?? "Unknown Friend" )
        .navigationBarTitleDisplayMode(.inline)
    }
}

//struct DetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailView()
//    }
//}
