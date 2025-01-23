//
//   CharacterRowView.swift
//  HarryPorter
//
//  Created by Spriyha Maurya on 23/01/25.
//

import SwiftUI

struct CharacterRowView: View {
    let character: Character

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            // Name Header
            Text(character.name)
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.yellow)
                .cornerRadius(4)
            
            // Character Image
            if let imageUrl = character.image {
                AsyncImage(url: URL(string: imageUrl)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 350)
                        .cornerRadius(8)
                        .clipped()
                } placeholder: {
                    ProgressView()
                }
            }

            // Table of Details
            VStack(spacing: 0) {
                TableRow(label: "Species", value: character.species ?? "Unknown")
                TableRow(label: "Gender", value: character.gender ?? "Unknown")
                TableRow(label: "House", value: character.house ?? "Unknown", valueBackgroundColor: houseColor(for: character.house))
                if let dateOfBirth = character.dateOfBirth {
                    TableRow(label: "Date of Birth", value: formattedDate(dateOfBirth))
                }
            }
            .padding(.horizontal)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(8)
        .shadow(radius: 4)
    }

    // Helper for house color
    func houseColor(for house: String?) -> Color {
        switch house?.lowercased() {
        case "gryffindor":
            return Color.red
        case "slytherin":
            return Color.green
        case "ravenclaw":
            return Color.blue
        case "hufflepuff":
            return Color.yellow
        default:
            return Color.gray
        }
    }

    // Helper for date formatting
    func formattedDate(_ date: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy"
        if let dateObj = formatter.date(from: date) {
            formatter.dateFormat = "dd MMM, yyyy"
            return formatter.string(from: dateObj)
        }
        return date
    }
}

struct TableRow: View {
    let label: String
    let value: String
    var valueBackgroundColor: Color? = nil

    var body: some View {
        HStack {
            Text(label)
                .bold()
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.vertical, 8)

            Text(value)
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(.vertical, 8)
                .background(valueBackgroundColor ?? Color.clear)
                .foregroundColor(valueBackgroundColor != nil ? .white : .black)
                .cornerRadius(4)
        }
        .overlay(Divider(), alignment: .bottom)
    }
}
