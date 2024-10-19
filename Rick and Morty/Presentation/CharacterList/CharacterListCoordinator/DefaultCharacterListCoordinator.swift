//
//  DefaultCharacterListCoordinator.swift
//  Rick and Morty
//
//  Created by Khaled hashem on 19/10/2024.
//

import UIKit
import SwiftUI

final class DefaultCharacterListCoordinator: CharacterListCoordinator {
    private var navigationController: UINavigationController?
    private let characterListDependencyContainer: CharacterListDependencyContainer
    
    init(navigationController: UINavigationController? = nil,
         characterListDependencyContainer: CharacterListDependencyContainer) {
        self.navigationController = navigationController
        self.characterListDependencyContainer = characterListDependencyContainer
    }
        
    func openCharacterDetails(character: CharacterDetails) {
        let characterDetailsView = characterListDependencyContainer.makeCharacterDetailsView(character: character)
        navigationController?.pushViewController(characterDetailsView, animated: true)
    }
}
