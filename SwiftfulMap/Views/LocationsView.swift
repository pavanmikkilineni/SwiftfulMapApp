//
//  LocationView.swift
//  SwiftfulMap
//
//  Created by Pavan Mikkilineni on 13/01/22.
//

import SwiftUI

struct LocationsView: View {
    
    @EnvironmentObject private var viewModel:LocationsViewModel
    
    var body: some View {
        List{
            ForEach(viewModel.locations){
                Text($0.name)
            }
        }
    }
}

struct LocationsView_Previews: PreviewProvider {
    static var previews: some View {
        LocationsView()
            .environmentObject(LocationsViewModel())
    }
}
