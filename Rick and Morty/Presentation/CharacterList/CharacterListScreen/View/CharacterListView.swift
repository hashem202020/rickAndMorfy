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
            } cardSelectionHandler: { index in
                viewModel.openDetails(index: index)
            }

        }
        .padding(16)
        .frame(maxWidth: .infinity)
    }
}
