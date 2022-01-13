//
//  Location.swift
//  SwiftfulMap
//
//  Created by Pavan Mikkilineni on 13/01/22.
//

import Foundation
import MapKit

struct Location:Identifiable{
    let name:String
    let cityName:String
    let coordinates:CLLocationCoordinate2D
    let description:String
    let imageNames:[String]
    let link:String
    var id:String{
        name+cityName
    }
}
