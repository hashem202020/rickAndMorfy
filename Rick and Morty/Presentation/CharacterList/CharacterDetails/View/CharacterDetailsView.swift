//
//  CharacterDetailsView.swift
//  Rick and Morty
//
//  Created by Khaled hashem on 19/10/2024.
//

import SwiftUI

struct CharacterDetailsView: View {
    @StateObject var viewModel: CharacterDetailsViewModel
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                AsyncImage(url: URL(string: viewModel.character.image)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(20)
                } placeholder: {
                    ProgressView()
                }
                
                cardDescription
            }
            .padding(.top)
            
        }
        .edgesIgnoringSafeArea(.top)
    }
    
    var cardDescription: some View {
        VStack(alignment: .leading, spacing: 16) {
            detailsContent
            locationText
        }
        .padding(.horizontal, 20)

    }
    
    var detailsContent: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack(alignment: .center) {
                Text(viewModel.character.name)
                    .font(.system(size: 18))
                
                Spacer()
                
                HStack {
                    Text(viewModel.character.status)
                        .font(.system(size: 18))
                        .padding(10)
                }
                .background(Color.cyan)
                .cornerRadius(25)
                
            }
            Text("\(viewModel.character.species)  *  \(viewModel.character.gender)")
                .font(.system(size: 14))
        }
    }
    
    var locationText: some View {
        HStack {
            Text("Location: \(viewModel.character.location.name)")
                .font(.system(size: 16))
        }
    }

}
