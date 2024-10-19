//
//  CharacterDetailsViewModel.swift
//  Rick and Morty
//
//  Created by Khaled hashem on 19/10/2024.
//

import Foundation

final class CharacterDetailsViewModel: ObservableObject {
    let character: CharacterDetails
    
    init(character: CharacterDetails) {
        self.character = character
    }
}
