//
//  LocationDetailView.swift
//  SwiftfulMap
//
//  Created by Pavan Mikkilineni on 14/01/22.
//

import SwiftUI
import MapKit

struct LocationDetailView: View {
    
    @EnvironmentObject private var viewModel:LocationsViewModel
    let location:Location
    
    var body: some View {
        ScrollView(showsIndicators:false){
            VStack{
               imageSection
                    .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 10)
                VStack(alignment:.leading,spacing: 16){
                   titleSection
                    Divider()
                    descriptionSection
                    Divider()
                    mapLayer
                }
                .frame( maxWidth:.infinity,alignment: .leading)
                .padding()
            }
        }
        .ignoresSafeArea()
        .background(.ultraThinMaterial)
        .overlay(alignment:.topLeading){
            backButton
        }
    }
}

extension LocationDetailView{
    private var imageSection:some View{
        TabView{
            ForEach(location.imageNames,id:\.self){
                Image($0)
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIDevice.current.userInterfaceIdiom == .pad ? nil : UIScreen.main.bounds.width)
                    .clipped()
            }
        }
        .frame(height:500)
        .tabViewStyle(PageTabViewStyle())
    }
    
    private var titleSection:some View{
        VStack(alignment:.leading,spacing: 8){
            Text(location.name)
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundColor(.primary)
            Text(location.cityName)
                .font(.title3)
                .foregroundColor(.secondary)
        }
    }
    
    private var descriptionSection:some View{
        VStack(alignment:.leading,spacing: 8){
            Text(location.description)
                .font(.subheadline)
                .fontWeight(.semibold)
            if let url = URL(string:location.link){
                Link("Read more on Wikipedia",destination: url)
                    .font(.headline)
                    .tint(.blue)
            }
        }
    }
    
    private var mapLayer:some View{
        Map(coordinateRegion:.constant(MKCoordinateRegion(
            center: location.coordinates, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        )),annotationItems: [location]){
            location in
            MapAnnotation(coordinate: location.coordinates) {
                LocationMapAnnotationsView()
                    .shadow(radius: 10)
            }
        }
        
            .aspectRatio(1, contentMode: .fit)
            .cornerRadius(30)
            .allowsHitTesting(false)
    }
    
    private var backButton:some View{
        Button(action:{viewModel.sheetLocation = nil}){
            Image(systemName:"xmark")
                .font(.headline)
                .padding(16)
                .foregroundColor(.primary)
                .background(.thickMaterial)
                .cornerRadius(10)
                .shadow(radius: 4)
                .padding()
        }
    }
}

struct LocationDetailView_Previews: PreviewProvider {
    static var previews: some View {
        LocationDetailView(location: LocationsDataService.locations.first!)
            .environmentObject(LocationsViewModel())
    }
}
