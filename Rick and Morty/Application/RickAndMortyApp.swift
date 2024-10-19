//
//  RickAndMortyApp.swift
//  Rick and Morty
//
//  Created by Khaled hashem on 18/10/2024.
//

import SwiftUI

@main
struct RickAndMortyApp: App {
    private let appDependencyContainer = AppDependencyContainer()
    
    var body: some Scene {
        WindowGroup {
            appDependencyContainer.makeCharacterListView()
        }
    }
}
