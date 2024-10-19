//
//  CharacterListResultDTO.swift
//  Rick and Morty
//
//  Created by Khaled hashem on 18/10/2024.
//

import Foundation

struct CharacterDetailsDTO: Codable {
    let id: Int
    let name, status, species, type: String?
    let gender: String?
    let origin, location: CharacterLocationDTO
    let image: String?
    let episode: [String]
    let url: String?
    let created: String?
    
    public func toDomainModel() -> CharacterDetails {
        CharacterDetails(id: id,
                         name: name ?? "",
                         status: status ?? "",
                         species: species ?? "",
                         type: type ?? "",
                         gender: gender ?? "",
                         origin: origin.toDomainModel(),
                         location: location.toDomainModel(),
                         image: image ?? "",
                         episode: episode,
                         url: url ?? "",
                         created: created ?? "")
    }
}
