//
//  HomeModel.swift
//  Marvel
//
//  Created by Jorge Martínez on 25/10/2020.
//

import Foundation

struct CharactersResponse: Codable {
    let data: CharactersData?
    
    enum CodingKeys: String, CodingKey {
        case data = "data"
    }
}

struct CharactersData: Codable {
    let results: [Character]?
    
    enum CodingKeys: String, CodingKey {
        case results = "results"
    }
}

struct Character: Codable {
    let id: Int?
    let name: String?
    let description: String?
    let thumbnail: CharacterThumbnail?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case description = "description"
        case thumbnail = "thumbnail"
    }
}

struct CharacterThumbnail: Codable {
    let path: String?
    let fileExtension: String?
    
    enum CodingKeys: String, CodingKey {
        case path = "path"
        case fileExtension = "extension"
    }
}

extension Character {
    var characterImageURL: URL? {
        let thumbnail: CharacterThumbnail? = self.thumbnail
        let path: String = thumbnail?.path ?? ""
        let fileExtension: String = thumbnail?.fileExtension ?? ""
        return URL(string: path + "." + fileExtension)
    }
}
