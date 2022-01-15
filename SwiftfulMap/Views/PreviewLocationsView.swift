//
//  PreviewLocationsView.swift
//  SwiftfulMap
//
//  Created by Pavan Mikkilineni on 14/01/22.
//

import SwiftUI

struct PreviewLocationsView: View {
    
    @EnvironmentObject private var viewModel:LocationsViewModel
    let location:Location
    
    var body: some View {
        HStack(alignment:.bottom,spacing: 0){
            VStack(alignment:.leading,spacing:16){
                imageSection
                titleSection
            }
            VStack(spacing:8){
              learnMoreButton
              nextButton
            }
        }
        .padding(20)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(.ultraThinMaterial)
                .offset(y:65)
        )
        .clipped()
        .cornerRadius(10)
    }
}

extension PreviewLocationsView{
    
    private var imageSection:some View{
        ZStack{
            if let imageName = location.imageNames.first{
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width:100,height:100)
                    .cornerRadius(10)
            }
        }
        .padding(6)
        .background(.ultraThinMaterial)
        .cornerRadius(10)
    }
    
    private var titleSection:some View{
        VStack(alignment:.leading,spacing: 4){
            Text(location.name)
                .font(.title2)
                .fontWeight(.bold)
            Text(location.cityName)
                .font(.subheadline)
        }
        .frame(maxWidth:.infinity,alignment: .leading)
    }
    
    private var learnMoreButton:some View{
        Button(action:{viewModel.sheetLocation = location}){
            Text("Learn more")
                .font(.headline)
                .frame(width:125,height: 35)
        }
        .buttonStyle(.borderedProminent)
    }
    
    private var nextButton:some View{
        Button(action:viewModel.nextButtonPressed){
            Text("Next")
                .font(.headline)
                .frame(width:125,height: 35)
        }
        .buttonStyle(.bordered)
    }
}

struct PreviewLocationsView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            Color.blue.ignoresSafeArea()
            PreviewLocationsView(location: LocationsDataService.locations.first!)
        }
    }
}
