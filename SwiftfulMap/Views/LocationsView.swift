//
//  LocationView.swift
//  SwiftfulMap
//
//  Created by Pavan Mikkilineni on 13/01/22.
//

import SwiftUI
import MapKit

struct LocationsView: View {
    
    @EnvironmentObject private var viewModel:LocationsViewModel
    
    var body: some View {
        ZStack{
            Map(coordinateRegion:$viewModel.mkCoordinateRegion)
                .ignoresSafeArea()
            VStack(spacing:0){
                header
                    .padding()
                Spacer()
            }
        }
    }
}

extension LocationsView{
    private var header: some View{
        VStack{
            Button(action:viewModel.toggleShowLocationsList){
                Text("\(viewModel.mapLocation.name), \(viewModel.mapLocation.cityName)")
                    .font(.title2)
                    .fontWeight(.black)
                    .foregroundColor(.primary)
                    .frame(height:55)
                    .frame(maxWidth:.infinity)
                    .overlay(alignment:.leading){
                        Image(systemName: "arrow.down")
                            .font(.headline)
                            .foregroundColor(.primary)
                            .padding()
                            .rotationEffect(
                                Angle(
                                    degrees: viewModel.showLocationsList ? 180 : 0
                                )
                            )
                    }
            }
            if viewModel.showLocationsList{
                LocationsListView()
            }
        }
        .background(.thickMaterial)
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 15)
    }
}

struct LocationsView_Previews: PreviewProvider {
    static var previews: some View {
        LocationsView()
            .environmentObject(LocationsViewModel())
    }
}
