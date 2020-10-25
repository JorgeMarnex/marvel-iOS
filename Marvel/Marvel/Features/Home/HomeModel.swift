//
//  HomeModel.swift
//  Marvel
//
//  Created by Jorge Martínez on 25/10/2020.
//

import Foundation

struct HomeResponse: Codable {
    let id: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
    }
}
