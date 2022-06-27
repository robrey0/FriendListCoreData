//
//  DetailView.swift
//  FriendListCoreData
//
//  Created by NEW on 6/25/22.
//

import SwiftUI

struct DetailView: View {
    
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    @State private var showingDeleteAlert = false
    
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
        .alert("Delete Friend?", isPresented: $showingDeleteAlert) {
            Button("Delete", role: .destructive, action: deleteFriend)
            Button("Cancel", role: .cancel, action: { })
        } message: {
            Text("Are you sure?")
        }
        .toolbar {
            Button {
                showingDeleteAlert = true
            } label: {
                Label("Delete this Friend?", systemImage: "trash")
            }
        }
        
    }
    
    func deleteFriend() {
        moc.delete(friend)
        
        try? moc.save()
        dismiss()
    }
}

//struct DetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailView()
//    }
//}
