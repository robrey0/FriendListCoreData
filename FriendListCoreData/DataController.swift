//
//  DataController.swift
//  FriendListCoreData
//
//  Created by NEW on 6/22/22.
//

import CoreData
import Foundation

class  DataController: ObservableObject {
    let container = NSPersistentContainer(name: "FriendList")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("core data failed to load \(error.localizedDescription)")
            }
        }
    }
}
