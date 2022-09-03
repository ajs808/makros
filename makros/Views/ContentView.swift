//
//  ContentView.swift
//  makros
//
//  Created by Arul on 9/2/22.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @Environment(\.presentationMode)  var presentationMode
    @Environment(\.managedObjectContext) var managedObjContext
    @FetchRequest(sortDescriptors: [SortDescriptor(\.date, order: .reverse)]) var foodItems: FetchedResults<Food>
    
    let calGoal = 2400
    let proteinGoal = 200
    let fatGoal = 120
    let carbGoal = 275
    
    @State private var showingAddView = false
//    @State var calorieProgress: Float  = 0.4
    
    
    var body: some View {
        NavigationView {
            ZStack{
                VStack(alignment: .leading){
                    List {
                        VStack(alignment: .leading){
                            Text("\(Int(totalCaloriesToday()))/\(calGoal) cals today")
                                .foregroundColor(.gray)
                            ProgressBarView(value: Float(totalCaloriesToday())/Float(calGoal), color: .blue).frame(height: 20)
                            Text("\(Int(totalProteinToday()))/\(proteinGoal)g protein today")
                                .foregroundColor(.gray)
                            ProgressBarView(value: Float(totalProteinToday())/Float(proteinGoal), color: .red).frame(height: 20)
                            Text("\(Int(totalFatToday()))/\(fatGoal)g fat today")
                                .foregroundColor(.gray)
                            ProgressBarView(value: Float(totalFatToday())/Float(fatGoal), color: .green).frame(height: 20)
                            Text("\(Int(totalCarbsToday()))/\(carbGoal)g carbs today")
                                .foregroundColor(.gray)
                            ProgressBarView(value: Float(totalCarbsToday())/Float(carbGoal), color: .orange).frame(height: 20)
                        }
                        .listRowSeparator(.hidden)
                        
                        ForEach(foodItems) { food in
                            NavigationLink(destination: EditFoodView(food: food)) {
                                HStack{
                                    VStack(alignment: .leading, spacing: 6){
                                        Text(food.name!)
                                            .bold()
                                        Text("\(Int(food.calories))") + Text(" calories").foregroundColor(.blue)
                                        Text("\(Int(food.protein))g") + Text(" protein").foregroundColor(.red)
                                        Text("\(Int(food.fat))g") + Text(" fat").foregroundColor(.green)
                                        Text("\(Int(food.carbs))g") + Text(" carbohydrates").foregroundColor(.orange)
                                    }
                                    Spacer()
                                    VStack{
                                        Text(calcTimeSince(date:food.date!))
                                            .foregroundColor(.gray)
                                            .italic()
                                    }
                                }
                            }
                            .contextMenu{
                                Button {
                                    DataController().addFood(name: food.name!, calories: food.calories, protein: food.protein, fat: food.fat, carbs: food.carbs, context: managedObjContext)
                                } label: {
                                    Label("Duplicate", systemImage: "doc.on.doc")
                                }
                            }
                        }
                        .onDelete(perform: deleteFood)
                        VStack{
                            Text("")
                            Text("")
                            Text("")
                            Text("")
                            Text("")
                            Text("")
                            Text("")
                            Text("")
                        }
                        .listRowSeparator(.hidden)
                    }
                    .listStyle(.plain)
//                    HStack{
//                        Spacer()
//                        Text("makros app")
//                            .foregroundColor(.gray)
//                        Spacer()
//                    }
                }
                VStack {
                    Spacer()
                    HStack{
                        Spacer()
                        Button{
                            showingAddView.toggle()
                        } label: {
                            Text("+")
                                .font(.system(.largeTitle))
                                .frame(width: 77, height :70)
                                .foregroundColor(Color.white)
                                .padding(.bottom, 7)
                        }
                        .background(Color.blue)
                        .cornerRadius(38.5)
                        .padding()
                    }
                }
            }
            .navigationTitle("Today's macros") //TODO: Fix disable of toolbar items on AddView slide dismissal
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
            }
            .sheet(isPresented: $showingAddView) {
                AddFoodView()
            }
        }
        .navigationViewStyle(.stack)
    }
    
    private func deleteFood(offsets: IndexSet) {
        withAnimation {
            offsets.map { foodItems[$0]}.forEach(managedObjContext.delete)
            
            DataController().save(context: managedObjContext)
        }
    }
    
    //TODO: Simplify 4 funcs into one func that returns a dict of stats
    private func totalCaloriesToday() -> Double {
        var caloriesToday: Double = 0
        for item in foodItems {
            if Calendar.current.isDateInToday(item.date!) {
                caloriesToday += item.calories
            }
        }
        
        return caloriesToday
    }
    
    private func totalProteinToday() -> Double {
        var proteinToday: Double = 0
        for item in foodItems {
            if Calendar.current.isDateInToday(item.date!) {
                proteinToday += item.protein
            }
        }
        
        return proteinToday
    }
    
    private func totalFatToday() -> Double {
        var fatToday: Double = 0
        for item in foodItems {
            if Calendar.current.isDateInToday(item.date!) {
                fatToday += item.fat
            }
        }
        
        return fatToday
    }
    
    private func totalCarbsToday() -> Double {
        var carbsToday: Double = 0
        for item in foodItems {
            if Calendar.current.isDateInToday(item.date!) {
                carbsToday += item.carbs
            }
        }
        
        return carbsToday
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
