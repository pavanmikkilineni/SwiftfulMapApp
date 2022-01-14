//
//  LocationMapAnnotationsView.swift
//  SwiftfulMap
//
//  Created by Pavan Mikkilineni on 14/01/22.
//

import SwiftUI

struct LocationMapAnnotationsView: View {
    var body: some View {
        VStack(spacing:0){
            Image(systemName:"map.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
                .font(.headline)
                .foregroundColor(.white)
                .padding(6)
                .background(accentColor)
                .clipShape(Circle())
            Image(systemName:"triangle.fill")
                .resizable()
                .scaledToFit()
                .foregroundColor(accentColor)
                .frame(width: 10, height: 10)
                .rotationEffect(Angle(degrees: 180))
                .offset(y:-6)
                .padding(.bottom,40)
        }
    }
}

struct LocationMapAnnotationsView_Previews: PreviewProvider {
    static var previews: some View {
        LocationMapAnnotationsView()
    }
}
