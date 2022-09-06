//
//  SettingsView.swift
//  makros
//
//  Created by Arul on 9/6/22.
//

import SwiftUI

struct SettingsView: View {
    
    @AppStorage("calGoal") private var calGoal = 2000
    @AppStorage("proteinGoal") private var proteinGoal = 120
    @AppStorage("fatGoal") private var fatGoal = 70
    @AppStorage("carbGoal") private var carbGoal = 240
    
    var body: some View {
        VStack{
            // TODO: Sanitize inputs to positive integers
            // Entering 0 for one of these values will cause issues
            Form{
                Section{
                    HStack {
                        Text("Calorie Goal: ")
                        TextField("Calorie Goal",value: $calGoal, formatter: NumberFormatter())
                            .keyboardType(.numberPad)
                    }
                    HStack {
                        Text("Protein Goal: ")
                        TextField("Protein Goal",value: $proteinGoal, formatter: NumberFormatter())
                            .keyboardType(.numberPad)
                    }
                    HStack {
                        Text("Fat Goal: ")
                        TextField("Fat Goal",value: $fatGoal, formatter: NumberFormatter())
                            .keyboardType(.numberPad)
                    }
                    HStack {
                        Text("Carbohydrate Goal: ")
                        TextField("Carbohydrate Goal",value: $carbGoal, formatter: NumberFormatter())
                            .keyboardType(.numberPad)
                    }
                }
            }
        }
        .navigationTitle("Settings")
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            SettingsView()
        }
    }
}
