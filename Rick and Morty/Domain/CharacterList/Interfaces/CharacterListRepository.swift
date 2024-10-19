//
//  CharacterListRepository.swift
//  Rick and Morty
//
//  Created by Khaled hashem on 18/10/2024.
//

import Foundation

public protocol CharacterListRepository {
    func fetchCharacterList(page: Int) async throws -> CharacterList
}
