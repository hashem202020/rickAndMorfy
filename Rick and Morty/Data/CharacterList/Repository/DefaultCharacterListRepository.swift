//
//  DefaultCharacterListRepository.swift
//  Rick and Morty
//
//  Created by Khaled hashem on 18/10/2024.
//

import Foundation
public final class DefaultCharacterListRepository: CharacterListRepository {
    // MARK: - Properties
    private let characterListRemoteAPI: CharacterListRemoteAPI
    
    // MARK: - Methods
    public init(characterListRemoteAPI: CharacterListRemoteAPI) {
        self.characterListRemoteAPI = characterListRemoteAPI
    }
    
    public func fetchCharacterList(page: Int) async throws -> CharacterList {
        let response = try await characterListRemoteAPI.fetchCharacterList(page: page)
        let characterList = response.toDomainModel()
        return characterList
    }
}
