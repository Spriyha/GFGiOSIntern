//
//  ViewModel.swift
//  HarryPorter
//
//  Created by Spriyha Maurya on 23/01/25.
//


import Foundation
import Combine

class CharactersViewModel: ObservableObject {
    @Published var characters: [Character] = []
    @Published var isLoading = false
    @Published var errorMessage: String?

    func fetchCharacters(for house: String) {
        isLoading = true
        errorMessage = nil

        APIService.shared.fetchCharacters(for: house) { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let characters):
                    self?.characters = characters
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
    }
}
