//
//  FriendListCoreDataApp.swift
//  FriendListCoreData
//
//  Created by NEW on 6/22/22.
//

import SwiftUI

@main
struct FriendListCoreDataApp: App {
    
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
