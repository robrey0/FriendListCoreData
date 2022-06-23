//
//  ContentView.swift
//  FriendListCoreData
//
//  Created by NEW on 6/22/22.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var friends: FetchedResults<Friend>
    
    @State private var showingAddFriendView = false
    
    var body: some View {
        NavigationView {
            Text("Number of friends: \(friends.count)")
                .navigationTitle("Friends List")
                .toolbar {
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
}

//func exampleCode() {
    //        VStack {
    //            List(friends) { friend in
    //                Text(friend.name ?? "No friends")
    //            }
    //
    //            Button("Add") {
    //                let firstNames = ["Beto", "Juan","Licuado"]
    //                let lastNames = ["Reyes", "Nieto", "Soler"]
    //
    //                let randomFirst = firstNames.randomElement()!
    //                let randomLast = lastNames.randomElement()!
    //
    //                let friend = Friend(context: moc)
    //                friend.id = UUID()
    //                friend.name = "\(randomFirst) \(randomLast)"
    //
    //                try? moc.save()
    //
    //            }
    //
    //        }
    //            .padding()
//}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
