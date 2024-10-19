//
//  CharacterListInfoDTO.swift
//  Rick and Morty
//
//  Created by Khaled hashem on 18/10/2024.
//

import Foundation

struct CharacterListInfoDTO: Codable {
    let count, pages: Int
    let next: String
    let prev: String?
    
    public func toDomainModel() -> CharacterListInfo {
        return CharacterListInfo(count: count,
                                 pages: pages,
                                 next: next,
                                 prev: prev)
    }
}
