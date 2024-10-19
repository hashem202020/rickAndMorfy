//
//  CharacterLocationDTO.swift
//  Rick and Morty
//
//  Created by Khaled hashem on 18/10/2024.
//

import Foundation

struct CharacterLocationDTO: Codable {
    let name: String?
    let url: String?
    
    public func toDomainModel() -> CharacterLocation {
        CharacterLocation(name: name ?? "",
                          url: url ?? "")
    }
}
