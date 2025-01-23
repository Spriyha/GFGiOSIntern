//
//  HomeView.swift
//  HarryPorter
//
//  Created by Spriyha Maurya on 23/01/25.
//

import SwiftUI

struct HomeView: View {
    let houses = [
        ("Gryffindor", "https://ik.imagekit.io/hpapi/gryffindor.jpg"),
        ("Slytherin", "https://ik.imagekit.io/hpapi/slytherin.jpg"),
        ("Ravenclaw", "https://ik.imagekit.io/hpapi/ravenclaw.jpg"),
        ("Hufflepuff", "https://ik.imagekit.io/hpapi/hufflepuff.jpg")
    ]

    var body: some View {
        NavigationView {
            LazyVGrid(columns: [GridItem(), GridItem()]) {
                ForEach(houses, id: \.0) { house in
                    NavigationLink(destination: CharactersListView(house: house.0.lowercased())) {
                        VStack {
                            AsyncImage(url: URL(string: house.1)) { image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(width: 100, height: 100)
                            Text(house.0)
                                .font(.headline)
                                .foregroundColor(.black)
                        }
                        .padding()
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(10)
                    }
                }
            }
            .padding()
            .navigationTitle("Hogwarts Houses")
        }
    }
}
