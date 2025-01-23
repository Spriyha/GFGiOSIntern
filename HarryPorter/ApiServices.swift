//
//  ApiServices.swift
//  HarryPorter
//
//  Created by Spriyha Maurya on 23/01/25.
//


import Foundation

class APIService {
    static let shared = APIService()
    
    func fetchCharacters(for house: String, completion: @escaping (Result<[Character], Error>) -> Void) {
        let urlString = "https://hp-api.herokuapp.com/api/characters/house/\(house)"
        guard let url = URL(string: urlString) else {
            completion(.failure(NSError(domain: "Invalid URL", code: 400, userInfo: nil)))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "No Data", code: 404, userInfo: nil)))
                return
            }
            
            do {
                let characters = try JSONDecoder().decode([Character].self, from: data)
                DispatchQueue.main.async {
                    completion(.success(characters))
                }
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
