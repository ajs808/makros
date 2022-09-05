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
    
    @State private var isActive = false
    @State private var size = 2.0
    @State private var opacity = 0.5
    
    var body: some Scene {
        WindowGroup {
            if isActive{
                ContentView()
                    .environment(\.managedObjectContext, dataController.container.viewContext)
            }
            else{
                VStack{
                    VStack{
                        Image(systemName: "chart.pie.fill")
                            .font(.system(size: 80))
                            .foregroundColor(.blue)
                        Text("makros")
                            .font(.largeTitle.weight(.semibold))
                            .foregroundColor(.black.opacity(0.80))
                    }
                    .scaleEffect(size)
                    .opacity(opacity)
                    .onAppear {
                        withAnimation(.easeInOut(duration: 1.0)) {
                            self.size = 0.9
                            self.opacity = 1.0
                        }
                    }
                }
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0){
                        withAnimation{
                            self.isActive = true
                        }
                    }
                }
            }
        }
    }
}
