//
//  HomeView.swift
//  RickandMorty
//
//  Created by Cem Girgin on 3.11.2022.
//

import SwiftUI

import SwiftUI

struct HomeView: View {
    
    @StateObject private var viewModel:HomeViewModel=HomeViewModel()
    
    var body: some View {
        NavigationView {
            VStack{
                switch viewModel.charactersState{
                    
                case .initial:
                    ProgressView()
                case .loading:
                    ProgressView()
                case .error(let error):
                    Text(error)
                case .loaded(let data):
                    ScrollView{
                        ForEach(data.results){ results in
                            
                            HStack {
                                AsyncImage(url: URL(string: results.image)){ image in
                                    image.resizable()
                                        .cornerRadius(25)
                                    
                                } placeholder: {
                                    ProgressView()
                                }
                                .frame(width: 100, height: 100)
                                VStack(alignment:.leading) {
                                    Text(results.name)
                                        .font(.headline)
                                        .fontWeight(.medium)
                                    Text(results.gender)
                                        .font(.subheadline)
                                        .fontWeight(.regular)
                                }
                                .frame(maxWidth:.infinity,maxHeight:.infinity,alignment:.leading)
                                Text(results.species)
                                    .font(.caption)
                                    .fontWeight(.light)
                                Text(results.status)
                                    .font(.caption)
                                    .fontWeight(.light)
                            }
                            .padding()
                            
                        }
                    }
                }
            }
            .navigationTitle("Characters")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .previewDevice("iPhone 12 mini")
    }
}
