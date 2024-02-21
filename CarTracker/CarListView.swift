//
//  CarListView.swift
//  CarTracker
//
//  Created by Nathan Yu on 2024/1/21.
//

import SwiftUI

struct CarListView: View {
    @State var showNewCarSheet: Bool = false
    
    
    var body: some View {
        NavigationView {
            ZStack {
                ScrollView {
                    VStack {
                        ForEach(CoreDataManager.singleton.carEntities) {
                            entity in
                            CarInstanceView(carEntity: entity)
                        }
                        AddCarButton(showNewCarSheet: $showNewCarSheet)
                        Spacer()
                        
                        
                    }
                    .padding()
                }
            }
            .navigationTitle("Cars")
            .sheet(isPresented: $showNewCarSheet, content: {
                NewCarView()
            })
        }
    }
}

#Preview {
    CarListView()
}

struct CarInstanceView: View {
    var carEntity: CarEntity
    
    var body: some View {
        NavigationLink(destination: CarView(carEntity: carEntity)) {
            ZStack {
                RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.red)
                    .frame(height: 150)
                HStack {
                    Text(carEntity.name ?? "Test car")
                        .foregroundColor(.white)
                    Spacer()
                    Image("carPic1")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 100)
                }
                .padding()
            }
        }
    }
}



struct AddCarButton: View {
    @Binding var showNewCarSheet: Bool
    
    var body: some View {
        Button {
            showNewCarSheet.toggle()
        } label: {
            Text("Add Car")
        }
        .buttonStyle(.bordered)
        .tint(.red)
        
    }
}

