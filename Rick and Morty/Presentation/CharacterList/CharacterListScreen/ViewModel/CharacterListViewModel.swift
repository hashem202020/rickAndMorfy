//
//  CharacterListViewModel.swift
//  Rick and Morty
//
//  Created by Khaled hashem on 18/10/2024.
//

import Foundation

final class CharacterListViewModel: ObservableObject {
    private let getCharactersUseCase: GetCharacterListUseCase
    private let characterListCoordinator: CharacterListCoordinator
    
    private var currentPage = 1
    private var canLoadMoreCharacters = true

    @Published var characters: [CharacterDetails] = []
    
    init(getCharactersUseCase: GetCharacterListUseCase,
         characterListCoordinator: CharacterListCoordinator) {
        self.getCharactersUseCase = getCharactersUseCase
        self.characterListCoordinator = characterListCoordinator
        loadCharacterList()
    }
    
    func loadCharacterList() {
        guard canLoadMoreCharacters else { return }

        Task(priority: .background) {
            do {
                canLoadMoreCharacters = false

                let result = try await getCharactersUseCase.execute(with: currentPage)
                await MainActor.run {
                    characters.append(contentsOf: result.characters)
                    currentPage += 1
                    canLoadMoreCharacters = true
                }
            } catch let error {
                print(error)
            }
        }
    }
    
    func openDetails(index: Int) {
        characterListCoordinator.openCharacterDetails(character: characters[index])
    }
}
