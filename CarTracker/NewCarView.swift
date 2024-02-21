//
//  NewCarView.swift
//  CarTracker
//
//  Created by Nathan Yu on 2024/1/21.
//

import SwiftUI

struct NewCarView: View {
    
    @State private var name: String = ""
    @State private var mileageText: String = ""
    
    @State private var formHeight: CGFloat?
    
    var body: some View {
        VStack {
            Form {
                Section(header: Text("Car Details"), footer: HStack {
                    Spacer()
                    Button {
                        CoreDataManager.singleton.addCar(name: name)
                            
                    } label: {
                        Text("Save")
                    }
                    .buttonStyle(.bordered)
                    .tint(.red)
                    Spacer()
                }) {
                    TextField("Name", text: $name)
                    TextField("Mileage", text: $mileageText)
                        .keyboardType(.numberPad)
                }
            }
            Spacer()
        }
        
    }
}


#Preview {
    NewCarView()
}
