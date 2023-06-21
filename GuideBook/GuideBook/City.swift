//
//  City.swift
//  GuideBook
//
//  Created by Panachai Sulsaksakul on 6/21/23.
//

import Foundation

struct City: Identifiable, Decodable {
    let id: UUID = UUID()
    var name: String
    var summary: String
    var imageName: String
    
    var attractions: [Attraction]
}
