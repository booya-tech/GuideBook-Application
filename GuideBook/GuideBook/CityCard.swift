//
//  CityCard.swift
//  GuideBook
//
//  Created by Panachai Sulsaksakul on 6/21/23.
//

import SwiftUI

struct CityCard: View {
    var city: City
    
    var body: some View {
        
        ZStack {
            
            // Image Rectangle View
            Rectangle().background(content: {
                Image(city.imageName).resizable().aspectRatio(contentMode: .fill)
            }).foregroundColor(.clear).cornerRadius(15)
            
            // Low Opacity Rectangle View
            Rectangle().foregroundColor(.black).opacity(0.5).cornerRadius(15)
            
            // City Tile & Short City's summary
            VStack(alignment: .leading) {
                
                Text(city.name).font(.largeTitle).fontWeight(.bold)
                Spacer()
                Text(city.summary).multilineTextAlignment(.leading)
                
            }.padding().foregroundColor(.white)
            
        }.frame(height: 400)
        
    }
}

struct CityCard_Previews: PreviewProvider {
    static var previews: some View {
        CityCard(city: City(name: "Tokyo", summary: "Tokyo serves as Japan's economic center and is the seat of both the Japanese government and the Emperor of Japan. Tokyo.", imageName: "tokyo", attractions: [Attraction]()))
    }
}
