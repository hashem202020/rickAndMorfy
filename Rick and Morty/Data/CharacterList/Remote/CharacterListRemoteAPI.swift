//
//  CharacterListRemoteAPI.swift
//  Rick and Morty
//
//  Created by Khaled hashem on 18/10/2024.
//

import Foundation

public protocol CharacterListRemoteAPI: RemoteAPI {
    func fetchCharacterList(page: Int) async throws -> CharacterListDTO
}

public final class DefaultCharacterListRemoteAPI: CharacterListRemoteAPI {
    
    public func fetchCharacterList(page: Int) async throws -> CharacterListDTO {
        try await request(endPoint: "character", method: .get, parameters: ["page": page])
    }
}
