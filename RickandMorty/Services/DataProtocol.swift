//
//  DataProtocol.swift
//  RickandMorty
//
//  Created by Cem Girgin on 3.11.2022.
//

import Foundation
import Combine

protocol DataProtocol {
    func getAllCharacters () -> AnyPublisher<CharacterModel,Error>
}
