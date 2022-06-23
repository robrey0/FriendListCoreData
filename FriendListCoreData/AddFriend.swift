//
//  AddFriend.swift
//  FriendListCoreData
//
//  Created by NEW on 6/23/22.
//

import SwiftUI

struct AddFriend: View {
    
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var age = ""
    @State private var vibe = ""
    @State private var review = ""
    @State private var rating = 3
    
    let vibes = ["Cool", "Chill", "No Vibe", "Mean", "Angry",]
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Name of friend", text: $name)
                    
                    Picker("Vibes", selection: $vibe) {
                        ForEach(vibes, id: \.self) {
                            Text($0)
                        }
                    }
                }
                
                Section {
                    TextEditor(text: $review)
                    
                    Picker("Rate Friend", selection: $rating) {
                        ForEach(0..<6) {
                            Text(String($0))
                        }
                    }
                } header : {
                    Text("Rate your friend and write a review.")
                }
                
                Section {
                    Button("Save") {
                        let newFreind = Friend(context: moc)
                        newFreind.id = UUID()
                        newFreind.name = name
                        newFreind.age = Int16(age) ?? 0
                        newFreind.vibe = vibe
                        newFreind.review = review
                        newFreind.rating = Int16(rating)
                        
                        try? moc.save()
                        dismiss()
                        
                    }
                }
            }
            .navigationTitle("Add New Friend")
        }
    }
}

struct AddFriend_Previews: PreviewProvider {
    static var previews: some View {
        AddFriend()
    }
}
