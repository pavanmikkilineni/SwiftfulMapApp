//
//  SwiftfulMapApp.swift
//  SwiftfulMap
//
//  Created by Pavan Mikkilineni on 13/01/22.
//

import SwiftUI

@main
struct SwiftfulMapApp: App {
    
    @StateObject private var viewModel:LocationsViewModel = LocationsViewModel()
    
    var body: some Scene {
        WindowGroup {
            LocationsView()
                .environmentObject(viewModel)
        }
    }
}
