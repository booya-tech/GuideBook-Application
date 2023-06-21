//
//  DetailView.swift
//  GuideBook
//
//  Created by Panachai Sulsaksakul on 6/21/23.
//

import SwiftUI

struct DetailView: View {
    var attraction: Attraction
    
    var body: some View {
        VStack {
            // Attraction Image put it outside the ScrollView
            Image(attraction.imageName).resizable().aspectRatio(contentMode: .fill).frame(height: 300)
            
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 20) {
                    // Attraction Title
                    Text(attraction.name).font(.largeTitle).fontWeight(.bold)
                    
                    // Long Description
                    Text(attraction.longDescription)
                    
                    // Get Direction Button ( editing )
                    // Create URL instance based on URL Scheme
                    if let url = URL(string: "maps://?q=\(cleanName(name: attraction.name))&sll=\(cleanCoords(latLong: attraction.latLong))&z=10&t=s") {
                        
                        // Test if URL can be opened
                        if UIApplication.shared.canOpenURL(url) {
                            Button {
                                
                                // Open the URL
                                UIApplication.shared.open(url)
                                
                            } label: {
                                
                                ZStack {
                                    RoundedRectangle(cornerRadius: 15).foregroundColor(.blue).frame(height: 40)
                                    Text("Get Directions").foregroundColor(.white)
                                }
                                
                            }
                        }
                    }
                }
            }.padding()
        }.ignoresSafeArea()
    }
    func cleanName(name: String) -> String {
        return name.folding(options: .diacriticInsensitive, locale: .current).replacingOccurrences(of: " ", with: "")
    }
    
    func cleanCoords(latLong: String) -> String {
        return latLong.replacingOccurrences(of: " ", with: "")
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(attraction: Attraction(name: "Pantheon",
                                          summary: "The Pantheon is a former Roman temple and, since 609 AD, a Catholic church in Rome, Italy, on the site of an earlier temple commissioned by Marcus Agrippa during the reign of Augustus.",
                                          longDescription: """
       The Pantheon from Greek is a former Roman temple and, since 609 AD, a Catholic church (Basilica di Santa Maria ad Martyres or Basilica of St. Mary and the Martyrs) in Rome, Italy, on the site of an earlier temple commissioned by Marcus Agrippa during the reign of Augustus (27 BC – 14 AD). It was rebuilt by the emperor Hadrian and probably dedicated c. 126 AD. Its date of construction is uncertain, because Hadrian chose not to inscribe the new temple but rather to retain the inscription of Agrippa's older temple, which had burned down.
       """,
                                          imageName: "pantheon", latLong: "41.898762500696236, 12.476915812472798"))
    }
}
