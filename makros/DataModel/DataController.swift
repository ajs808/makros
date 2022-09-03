//
//  DataController.swift
//  makros
//
//  Created by Arul on 9/2/22.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "FoodModel")
    
    init() {
        container.loadPersistentStores{desc, error in
            if let error = error {
                print("Failed to load data \(error.localizedDescription)")
            }
        }
    }
    
    func save(context: NSManagedObjectContext){
        do {
            try context.save()
            print("Data saved successfully")
        } catch {
            print("Data could not be saved")
        }
    }
    
    func addFood(name: String, calories: Double, protein: Double, fat: Double, carbs: Double, context: NSManagedObjectContext) {
        let food = Food(context: context)
        food.id = UUID()
        food.date = Date()
        food.name = name
        food.calories = calories
        food.protein = protein
        food.carbs = carbs
        food.fat = fat
        
        save(context: context)
    }
    
    func editFood(food: Food, name: String, calories: Double, protein: Double, fat: Double, carbs: Double, context: NSManagedObjectContext){
        food.date = Date()
        food.name = name
        food.calories = calories
        food.protein = protein
        food.carbs = carbs
        food.fat = fat
        
        save(context: context)
    }
}
