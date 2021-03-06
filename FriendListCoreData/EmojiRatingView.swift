//
//  EmojiRatingView.swift
//  FriendListCoreData
//
//  Created by NEW on 6/24/22.
//

import SwiftUI

struct EmojiRatingView: View {
    
    let rating: Int16
    var body: some View {
        switch rating {
        case 1:
            Text("âšī¸")
        case 2:
            Text("đ")
        case 3:
            Text("đ")
        case 4:
            Text("âēī¸")
        default:
            Text("đĨ°")
        }
    }
}

struct EmojiRatingView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiRatingView(rating: 5)
    }
}
