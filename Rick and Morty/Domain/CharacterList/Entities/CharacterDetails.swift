//
//  CharacterDetails.swift
//  Rick and Morty
//
//  Created by Khaled hashem on 18/10/2024.
//

import Foundation
public struct CharacterDetails {
    let id: Int
    let name, status, species, type: String
    let gender: String
    let origin, location: CharacterLocation
    let image: String
    let episode: [String]
    let url: String
    let created: String
}
