//
//  CharacterCard.swift
//  Rick and Morty
//
//  Created by Khaled hashem on 18/10/2024.
//

import SwiftUI

struct CharacterCard: View {
    var character: CharacterDetails
    
    var body: some View {
        HStack(alignment: .center) {
            HStack(alignment: .center) {
                AsyncImage(url: URL(string: character.image)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 50, height: 50)
                        .cornerRadius(10)
                    
                } placeholder: {
                    ProgressView()
                }.padding(.leading, 16)
                
                VStack(alignment: .leading) {
                    Text(character.name)
                        .font(.system(size: 18))
                    
                    Text(character.species)
                        .font(.system(size: 14))
                                        
                }
            }
            Spacer()
        }
        .frame(width: UIScreen.main.bounds.width - 32, height: 90)
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .overlay(RoundedRectangle(cornerRadius: 12).strokeBorder(Color.secondary, lineWidth: 1))
//        .background(
//            RoundedRectangle(
//                cornerRadius: 12,
//                style: .continuous
//            )
//            .fill(Color.white)
//
//        )
    }
}
