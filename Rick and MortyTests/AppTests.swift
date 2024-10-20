//
//  AppTests.swift
//  Rick and Morty
//
//  Created by Khaled hashem on 20/10/2024.
//

import XCTest
@testable import Rick_and_Morty

// Mock for GetCharacterListUseCase
class MockGetCharacterListUseCase: GetCharacterListUseCase {
    var characterListInfo: CharacterListInfo = CharacterListInfo(count: 20, pages: 1, next: "https://rickandmortyapi.com/api/character/?page=2", prev: nil)
    var charactersToReturn: [CharacterDetails] = []
    var shouldThrowError = false
    
    func execute(with page: Int) async throws -> CharacterList {
        if shouldThrowError {
            throw NSError(domain: "", code: -1, userInfo: nil)
        }
        return CharacterList(info: characterListInfo , characters: charactersToReturn)
    }
}

// Mock for CharacterListCoordinator
class MockCharacterListCoordinator: CharacterListCoordinator {
    var openedCharacter: CharacterDetails?
    
    func openCharacterDetails(character: CharacterDetails) {
        openedCharacter = character
    }
}

final class CharacterListViewModelTests: XCTestCase {
    var viewModel: CharacterListViewModel!
    var mockUseCase: MockGetCharacterListUseCase!
    var mockCoordinator: MockCharacterListCoordinator!

    override func setUp() {
        super.setUp()
        mockUseCase = MockGetCharacterListUseCase()
        mockCoordinator = MockCharacterListCoordinator()
        viewModel = CharacterListViewModel(getCharactersUseCase: mockUseCase,
                                           characterListCoordinator: mockCoordinator)
    }

    override func tearDown() {
        viewModel = nil
        mockUseCase = nil
        mockCoordinator = nil
        super.tearDown()
    }

    func testLoadCharacterListSuccess() async {
        // Arrange
        let character1 = CharacterDetails(id: 1, name: "Character 1", status: "status", species: "species", type: "type", gender: "male", origin: CharacterLocation(name: "", url: ""), location: CharacterLocation(name: "", url: ""), image: "image1.png", episode: [], url: "https://rickandmortyapi.com/api/character/1", created: "")
        
        let character2 = CharacterDetails(id: 2, name: "Character 2", status: "status", species: "species", type: "type", gender: "female", origin: CharacterLocation(name: "", url: ""), location: CharacterLocation(name: "", url: ""), image: "image1.png", episode: [], url: "https://rickandmortyapi.com/api/character/1", created: "")
        mockUseCase.charactersToReturn = [character1, character2]
        
        // Act
        viewModel.loadCharacterList()

        // Assert
        XCTAssertEqual(viewModel.characters.count, 2)
        XCTAssertEqual(viewModel.characters[0].name, "Character 1")
        XCTAssertEqual(viewModel.characters[1].name, "Character 2")
    }

    func testLoadCharacterListFailure() async {
        // Arrange
        mockUseCase.shouldThrowError = true
        
        // Act
        viewModel.loadCharacterList()

        // Assert
        XCTAssertEqual(viewModel.characters.count, 0) // Should not load any characters
    }

    func testOpenDetails() {
        // Arrange
        let character = CharacterDetails(id: 1, name: "Character 1", status: "status", species: "species", type: "type", gender: "male", origin: CharacterLocation(name: "", url: ""), location: CharacterLocation(name: "", url: ""), image: "image1.png", episode: [], url: "https://rickandmortyapi.com/api/character/1", created: "")

        viewModel.characters.append(character)

        // Act
        viewModel.openDetails(index: 0)

        // Assert
        XCTAssertEqual(mockCoordinator.openedCharacter?.name, "Character 1")
    }
}
