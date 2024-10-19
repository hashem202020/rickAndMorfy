//
//  AppDependencyContainer.swift
//  Rick and Morty
//
//  Created by Khaled hashem on 18/10/2024.
//

import Foundation

class AppDependencyContainer {
    
    func makeCharacterListView() -> CharacterListView {
        let viewModel = makeCharacterListViewModel()
        return CharacterListView(viewModel: viewModel)
    }
    
    private func makeCharacterListViewModel() -> CharacterListViewModel {
        CharacterListViewModel(getCharactersUseCase: makeGetCharacterListUseCase())
    }
    
    private func makeGetCharacterListUseCase() -> GetCharacterListUseCase {
        DefaultGetCharacterListUseCase(characterListRepository: makeCharacterListRepository())
    }
    
    private func makeCharacterListRepository() -> CharacterListRepository {
        DefaultCharacterListRepository(characterListRemoteAPI: makeCharacterListRemoteAPI())
    }
    
    private func makeCharacterListRemoteAPI() -> CharacterListRemoteAPI {
        DefaultCharacterListRemoteAPI()
    }
}
