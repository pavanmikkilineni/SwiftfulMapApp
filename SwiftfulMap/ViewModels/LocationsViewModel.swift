//
//  LocationsViewModel.swift
//  SwiftfulMap
//
//  Created by Pavan Mikkilineni on 13/01/22.
//

import Foundation
import MapKit
import SwiftUI

class LocationsViewModel : ObservableObject{
   
    @Published var locations:[Location]
    @Published var mapLocation:Location{
        didSet{
            updateMKCoordinateRegion(location: mapLocation)
        }
    }
    @Published var mkCoordinateRegion:MKCoordinateRegion = MKCoordinateRegion()
    
    @Published var showLocationsList:Bool = false
    
    let mapSpan:MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    
    init(){
        let locations = LocationsDataService.locations
        self.locations = locations
        self.mapLocation = locations.first!
        self.updateMKCoordinateRegion(location: mapLocation)
    }
    
    func updateMKCoordinateRegion(location:Location){
        withAnimation(.easeInOut){
            mkCoordinateRegion = MKCoordinateRegion(
                center: location.coordinates,
                span: mapSpan
                )
        }
    }
    
    func toggleShowLocationsList(){
        withAnimation(.easeInOut){
            showLocationsList.toggle()
        }
    }
    
    func showNextLocation(location:Location){
        mapLocation = location
        showLocationsList.toggle()
    }
    
    
}
