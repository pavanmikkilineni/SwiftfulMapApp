//
//  LocationsListview.swift
//  SwiftfulMap
//
//  Created by Pavan Mikkilineni on 13/01/22.
//

import SwiftUI

struct LocationsListView: View {
    
    @EnvironmentObject private var viewModel:LocationsViewModel
    
    var body: some View {
        List{
            ForEach(viewModel.locations){ location in
                Button(action:{viewModel.showNextLocation(location: location)}) {
                    HStack{
                        if let imageName = location.imageNames.first{
                            Image(imageName)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 45, height: 45)
                                .cornerRadius(10)
                        }
                        VStack(alignment:.leading){
                            Text(location.name)
                                .font(.headline)
                            Text(location.cityName)
                                .font(.subheadline)
                        }
                        .frame(maxWidth:.infinity,alignment:.leading)
                    }
                    .padding(.vertical,4)
                }
            }
        }
        .listStyle(PlainListStyle())
    }
}

struct LocationsListView_Previews: PreviewProvider {
    static var previews: some View {
        LocationsListView()
            .environmentObject(LocationsViewModel())
    }
}
