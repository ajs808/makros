//
//  EditFoodView.swift
//  makros
//
//  Created by Arul on 9/2/22.
//

import SwiftUI

struct EditFoodView: View {
    
    @Environment(\.managedObjectContext) var managedObjContext
    @Environment(\.dismiss) var dismiss
    
    var food: FetchedResults<Food>.Element
    
    @State private var name = ""
    @State private var calories: Double = 0
    @State private var protein: Double = 0
    @State private var fat: Double = 0
    @State private var carbs: Double = 0
    
    var body: some View {
        Form {
            Section {
                TextField("\(food.name!)", text: $name)
                    .onAppear {
                        name = food.name!
                        calories = food.calories
                        protein = food.protein
                        fat = food.fat
                        carbs = food.carbs
                    }
                HStack {
                    Text("Calories: ")
                    TextField("Calories",value: $calories, formatter: NumberFormatter())
                        .keyboardType(.numberPad)
                }
                HStack {
                    Text("Protein: ")
                    TextField("0",value: $protein, formatter: NumberFormatter())
                        .keyboardType(.numberPad)
                }
                HStack {
                    Text("Fat: ")
                    TextField("0",value: $fat, formatter: NumberFormatter())
                        .keyboardType(.numberPad)
                }
                HStack {
                    Text("Carbohydrates: ")
                    TextField("0",value: $carbs, formatter: NumberFormatter())
                        .keyboardType(.numberPad)
                }
                
                HStack{
                    Spacer()
                    Button("Submit") {
                        DataController().editFood(food: food, name: name, calories: calories, protein: protein, fat: fat, carbs: carbs, context: managedObjContext)
                        dismiss()
                    }
                    Spacer()
                }
            }
        }
    }
}
