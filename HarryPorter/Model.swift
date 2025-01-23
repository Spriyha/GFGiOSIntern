//
//  Model.swift
//  HarryPorter
//
//  Created by Spriyha Maurya on 23/01/25.
//

import Foundation


struct Character: Identifiable, Decodable {
    let id: String
    let name: String
    let species: String?
    let gender: String?
    let house: String?
    let dateOfBirth: String?
    let hogwartsStaff: Bool
    let image: String?
}
