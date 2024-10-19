//
//  ContentView.swift
//  Rick and Morty
//
//  Created by Khaled hashem on 18/10/2024.
//

import SwiftUI

struct CharacterListView: View {
    @StateObject var viewModel: CharacterListViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("Characters")
                .font(.largeTitle)
                .padding()

            CharacterTableView(items: viewModel.characters) {
                viewModel.loadCharacterList()
            }
        }
        .padding(16)
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    
    func makeCharacterListView() -> CharacterListView {
        let viewModel = makeCharacterListViewModel()
        return CharacterListView(viewModel: viewModel)
    }
    
    func makeCharacterListViewModel() -> CharacterListViewModel {
        CharacterListViewModel(getCharactersUseCase: makeGetCharacterListUseCase())
    }
    
    func makeGetCharacterListUseCase() -> GetCharacterListUseCase {
        DefaultGetCharacterListUseCase(characterListRepository: makeCharacterListRepository())
    }
    
    func makeCharacterListRepository() -> CharacterListRepository {
        DefaultCharacterListRepository(characterListRemoteAPI: makeCharacterListRemoteAPI())
    }
    
    func makeCharacterListRemoteAPI() -> CharacterListRemoteAPI {
        DefaultCharacterListRemoteAPI()
    }

    return makeCharacterListView()
}
