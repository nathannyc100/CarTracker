//
//  ContentView.swift
//  CarTracker
//
//  Created by Nathan Yu on 2024/1/20.
//

import SwiftUI

struct CarTrackerTabView: View {
    
    var body: some View {
        TabView {
            CarListView()
                .tabItem {
                    Image(systemName: "car.side")
                    Text("Cars")
                }
                .toolbarBackground(Color(UIColor.systemBackground), for: .tabBar)
                .toolbarBackground(.visible, for: .tabBar)
            CameraView()
                .tabItem {
                    Image(systemName: "camera")
                    Text("Camera")
                }
                .toolbarBackground(Color(UIColor.systemBackground), for: .tabBar)
                .toolbarBackground(.visible, for: .tabBar)
            SettingsView()
                .tabItem {
                    Image(systemName: "gearshape")
                    Text("Settings")
                }
                .toolbarBackground(Color(UIColor.systemBackground), for: .tabBar)
                .toolbarBackground(.visible, for: .tabBar)
                
        }
        .accentColor(Color("BrandPrimary"))
        .onAppear(perform: {
            CoreDataManager.singleton.addCar(name: "car1")
        })
    }
}

#Preview {
    CarTrackerTabView()
}


