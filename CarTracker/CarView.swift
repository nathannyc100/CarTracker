//
//  CarView.swift
//  CarTracker
//
//  Created by Nathan Yu on 2024/1/21.
//

import SwiftUI


struct CarView: View {
    var carEntity: CarEntity
    
    var body: some View {
        VStack {
            
        }
        .navigationTitle(carEntity.name ?? "")
        .toolbar {
            ToolbarItem(placement: .topBarTrailing, content: {
                HStack {
                    Image(systemName: "calendar")
                        .foregroundStyle(.red)
                    Image(systemName: "camera")
                        .foregroundStyle(.red)
                }
                
            })
        }
        
    }
}

#Preview {
    let mockCar = CarEntity(context: CoreDataManager.singleton.container.viewContext)
    mockCar.name = "Mock car"
    
    return NavigationView {
        CarView(carEntity: mockCar)
    }
    
    
    
}
