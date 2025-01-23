//
//  CharactersListView.swift
//  HarryPorter
//
//  Created by Sagar Maurya on 23/01/25.
//

import SwiftUI

struct CharactersListView: View {
    let house: String
    @StateObject private var viewModel = CharactersViewModel()

    var body: some View {
        VStack {
            if viewModel.isLoading {
                ProgressView("Loading...")
            } else if let error = viewModel.errorMessage {
                Text("Error: \(error)")
                    .foregroundColor(.red)
            } else {
                List(viewModel.characters) { character in
                    CharacterRowView(character: character)
                }
            }
        }
        .onAppear {
            viewModel.fetchCharacters(for: house)
        }
        .navigationTitle(house.capitalized)
    }
}
