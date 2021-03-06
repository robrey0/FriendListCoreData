//
//  ContentView.swift
//  FriendListCoreData
//
//  Created by NEW on 6/22/22.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: [SortDescriptor(\.name)]) var friends: FetchedResults<Friend>
    
    @State private var showingAddFriendView = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(friends) { friend in
                    NavigationLink {
                        DetailView(friend: friend)
                    } label : {
                        HStack {
                            EmojiRatingView(rating: friend.rating)
                                .font(.largeTitle)
                            
                            VStack(alignment: .leading) {
                                Text(friend.name ?? "Anonimo")
                                    .font(.headline)
                                
                                Text(friend.vibe ?? "Whatever Vibe")
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                }
                .onDelete(perform: deleteFriends)
            }
            .navigationTitle("Friends List")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showingAddFriendView.toggle()
                    } label: {
                        Label("Add Book", systemImage: "plus")
                    }
                }
            }
            .sheet(isPresented: $showingAddFriendView) {
                AddFriend()
            }
        }
    }
    
    func deleteFriends(at offsets: IndexSet) {
        for offset in offsets {
            let friend = friends[offset]
            moc.delete(friend)
        }
        
        try? moc.save()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
