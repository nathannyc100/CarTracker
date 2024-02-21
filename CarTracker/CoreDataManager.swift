//
//  CoreDataManager.swift
//  CarTracker
//
//  Created by Nathan Yu on 2024/2/9.
//

import CoreData

class CoreDataManager: ObservableObject {
    
    static let singleton = CoreDataManager()
    
    let container: NSPersistentContainer
    @Published var carEntities: [CarEntity] = []
    @Published var selectedCarEntity: CarEntity?
    
    init() {
        container = NSPersistentContainer(name: "CarContainer")
        container.loadPersistentStores{ (description, error) in
            if let error = error {
                print("Error loading data. \(error)")
            }
        }
        
        fetchCars()
    }
    
    
    
    func fetchCars() {
        let request = NSFetchRequest<CarEntity>(entityName: "CarEntity")
        
        do {
            carEntities = try container.viewContext.fetch(request)
        } catch let error {
            print("Error fetching \(error)")
        }
            
    }
    
    func addCar(name: String) {
        let newCar = CarEntity(context: container.viewContext)
        newCar.name = name
        
        saveData()
    }
    
    func saveData() {
        do {
            try container.viewContext.save()
            fetchCars()
        } catch let error {
            print("Error saing \(error)")
        }
    }
    
    func selectCar(carEntity: CarEntity) {
        selectedCarEntity = carEntity
    }
    
}
