//
//  CatDataService.swift
//  SwiftyMockyLab
//
//  Created by Lorenzo on 29/05/24.
//

import Foundation

protocol CatDataService: AutoMockable {
    func getFact() async throws -> CatFact
    func getFacts(limit: Int) async throws -> [CatFact]
}

struct CatDataServiceImplemention: CatDataService {

    func getFact() async throws -> CatFact {
        return try await NetworkManager.shared.fetch(
            type: CatFact.self,
            from: "fact"
        )
    }
    
    func getFacts(limit: Int) async throws -> [CatFact] {
        return try await NetworkManager.shared.fetch(
            type: CatFacts.self,
            from: "facts",
            queryItems: [.init(
                name: "limit",
                value: "\(limit)"
            )]
        ).data
    }
}

public struct CatFacts: Decodable {
    let data: [CatFact]
}

public struct CatFact: Decodable {
    let fact: String
    let length: Int
}
