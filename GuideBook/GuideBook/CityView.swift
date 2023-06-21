//
//  ContentView.swift
//  GuideBook
//
//  Created by Panachai Sulsaksakul on 6/21/23.
//

import SwiftUI

struct CityView: View {
    @State var cities = [City]()
    var dataService = DataService()
    
    var body: some View {
        // NavigationStack that contains => [CityView, AttractionView, DetailView]
        NavigationStack {
            
            ScrollView(showsIndicators: false) {
                
                ForEach(cities) { city in
                    NavigationLink {
                        AttractionView(city: city)
                    } label: {
                        CityCard(city: city).padding(.bottom, 20)
                    }
                    
                }
                
            }.padding(.horizontal)
            
        }
        
        .onAppear {
            cities = dataService.getFileData()
        }
    }
}

struct CityView_Previews: PreviewProvider {
    static var previews: some View {
        CityView()
    }
}
