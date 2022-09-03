//
//  makrosApp.swift
//  makros
//
//  Created by Arul on 9/2/22.
//

import SwiftUI

@main
struct makrosApp: App {
    
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
