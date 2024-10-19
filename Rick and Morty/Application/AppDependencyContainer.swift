//
//  AppDependencyContainer.swift
//  Rick and Morty
//
//  Created by Khaled hashem on 18/10/2024.
//

import Foundation

class AppDependencyContainer {
    var characterListDependencyContainer : CharacterListDependencyContainer {
        DefaultCharacterListDependencyContainer()
    }
}
