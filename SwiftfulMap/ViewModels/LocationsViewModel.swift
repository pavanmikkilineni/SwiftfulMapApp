//
//  LocationsViewModel.swift
//  SwiftfulMap
//
//  Created by Pavan Mikkilineni on 13/01/22.
//

import Foundation

class LocationsViewModel : ObservableObject{
   
    @Published var locations:[Location]
    
    init(){
        self.locations = LocationsDataService.locations
    }
    
    
}
