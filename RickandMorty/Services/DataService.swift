//
//  DataService.swift
//  RickandMorty
//
//  Created by Cem Girgin on 3.11.2022.
//

import Foundation
import Combine


class DataServices: DataProtocol{
    func getAllCharacters() -> AnyPublisher<CharacterModel, Error> {
        URLSession.shared.dataTaskPublisher(for: URL(string: "https://rickandmortyapi.com/api/character")!)
            .map({$0.data})
            .decode(type: CharacterModel.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
}
