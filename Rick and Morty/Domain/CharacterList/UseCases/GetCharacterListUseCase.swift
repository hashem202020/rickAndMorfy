//
//  GetCharacterListUseCase.swift
//  Rick and Morty
//
//  Created by Khaled hashem on 18/10/2024.
//

import Foundation

public protocol GetCharacterListUseCase {
    func execute(with page: Int) async throws -> CharacterList
}

final public class DefaultGetCharacterListUseCase: GetCharacterListUseCase {
    let characterListRepository: CharacterListRepository
    
    public init(characterListRepository: CharacterListRepository) {
        self.characterListRepository = characterListRepository
    }
    
    public func execute(with page: Int) async throws -> CharacterList {
        try await characterListRepository.fetchCharacterList(page: page)
    }
}
