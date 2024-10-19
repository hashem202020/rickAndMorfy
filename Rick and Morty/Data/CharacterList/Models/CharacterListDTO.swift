//
//  CharacterListDTO.swift
//  Rick and Morty
//
//  Created by Khaled hashem on 18/10/2024.
//

import Foundation
public struct CharacterListDTO: Codable {
    let info: CharacterListInfoDTO
    let results: [CharacterDetailsDTO]
    
    public func toDomainModel() -> CharacterList {
        CharacterList(info: info.toDomainModel(),
                      characters: results.map({$0.toDomainModel()}))
    }
}
