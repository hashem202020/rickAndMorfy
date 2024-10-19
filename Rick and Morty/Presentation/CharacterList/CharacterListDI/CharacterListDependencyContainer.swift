//
//  CharacterListDependencyContainer.swift
//  Rick and Morty
//
//  Created by Khaled hashem on 19/10/2024.
//

import SwiftUI

protocol CharacterListDependencyContainer {
    func makeCharacterListView(navigationController: UINavigationController?) -> UIHostingController<CharacterListView>
    func makeCharacterDetailsView(character: CharacterDetails) -> UIHostingController<CharacterDetailsView>
}

final class DefaultCharacterListDependencyContainer: CharacterListDependencyContainer {
    
    //MARK: character list

    func makeCharacterListView(navigationController: UINavigationController?) -> UIHostingController<CharacterListView> {
        let viewModel = makeCharacterListViewModel(navigationController: navigationController)
        return UIHostingController(rootView: CharacterListView(viewModel: viewModel))
    }
    
    private func makeCharacterListViewModel(navigationController: UINavigationController?) -> CharacterListViewModel {
        CharacterListViewModel(getCharactersUseCase: makeGetCharacterListUseCase(),
                               characterListCoordinator: makeCharacterListCoordinator(navigationController: navigationController))
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

    private func makeCharacterListCoordinator(navigationController: UINavigationController?) -> CharacterListCoordinator {
        DefaultCharacterListCoordinator(navigationController: navigationController, characterListDependencyContainer: self)
    }
    
    //MARK: character details
    func makeCharacterDetailsView(character: CharacterDetails) -> UIHostingController<CharacterDetailsView> {
        let viewModel = makeCharacterDetailsViewModel(character: character)
        return UIHostingController(rootView: CharacterDetailsView(viewModel: viewModel))
    }
    
    private func makeCharacterDetailsViewModel(character: CharacterDetails) -> CharacterDetailsViewModel {
        CharacterDetailsViewModel(character: character)
    }
}
