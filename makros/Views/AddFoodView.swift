//
//  AddFoodView.swift
//  makros
//
//  Created by Arul on 9/2/22.
//

import SwiftUI

struct AddFoodView: View {
    
    @Environment(\.managedObjectContext) var managedObjContext
    @Environment(\.presentationMode)  var presentationMode
    
    @State private var name = ""
    @State private var calories: Double = 0
    @State private var protein: Double = 0
    @State private var fat: Double = 0
    @State private var carbs: Double = 0
    @State private var date: Date = Date()
    
    var body: some View {
        Form{
            Section{
                TextField("Food name", text: $name)
                    .keyboardType(.default)
                //TODO: Make sure field can only accept numbers (even if they try to paste in something else
                HStack {
                    Text("Calories: ")
                    TextField("0",value: $calories, formatter: NumberFormatter())
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
                
                DatePicker(selection: $date, in: ...Date()) {
                                Text("Select a date")
                }
                
                HStack{
                    Spacer()
                    Button("Submit"){
                        DataController().addFood(name: name, calories: calories, protein: protein, fat: fat, carbs: carbs, context: managedObjContext)
                        presentationMode.wrappedValue.dismiss()
                    }
                    Spacer()
                }
            }
        }
    }
}

struct AddFoodView_Previews: PreviewProvider {
    static var previews: some View {
        AddFoodView()
    }
}
