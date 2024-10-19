//
//  AppCoordinator.swift
//  Rick and Morty
//
//  Created by Khaled hashem on 20/10/2024.
//

import UIKit
import SwiftUI

final class AppCoordinator: Coordinator {
    private var navigationController: UINavigationController?
    private let characterListDependencyContainer: CharacterListDependencyContainer

    init(navigationController: UINavigationController? = nil,
         characterListDependencyContainer: CharacterListDependencyContainer) {
        self.navigationController = navigationController
        self.characterListDependencyContainer = characterListDependencyContainer
        setupNavigationBarAppearance()
    }
    
    private func setupNavigationBarAppearance() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        appearance.shadowColor = .clear

        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
    }

    func start() {
        let characterListView = characterListDependencyContainer.makeCharacterListView(navigationController: navigationController)
        navigationController?.setViewControllers([characterListView], animated: false)

    }
}
