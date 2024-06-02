//
//  ViewModel.swift
//  SwiftyMockyLab
//
//  Created by Lorenzo on 02/06/24.
//

import Foundation
import Combine
import SwiftyMocky

class ViewModel: ObservableObject {
    
    @Published var environment: Environment = .mock
    @Published var fact: CatFact?
    
    private let catDataService: CatDataServiceImplemention = .init()
    private let mockedCatDataService: CatDataServiceMock = .init()
    
    init() {
        setupMocks()
    }
    
    func updateEnvironment(index: Int) {
        environment = index == 0 ? .mock : .real
    }
    
    func fetchFact() async throws -> CatFact? {
        switch environment {
        case .real:
            fact = try await catDataService.getFact()
            return fact
        case .mock:
            fact = try mockedCatDataService.getFact()
            return fact
        }
    }
    
    func testFetchFacts() {
        Task {
            let fact = try await catDataService.getFact()
            print("/fact from real dataservice:\n\(fact)\n\n")
            
            let facts = try await catDataService.getFacts(limit: 3)
            print("/facts from real dataservice:\n\(facts)\n\n")
            
            let mockedFact = try mockedCatDataService.getFact()
            print("/fact from fake dataservice:\n\(mockedFact)\n\n")
            
            let mockedFacts = try mockedCatDataService.getFacts(limit: 2)
            print("/facts from fake dataservice:\n\(mockedFacts)\n\n")
            
            let mockedFacts2 = try mockedCatDataService.getFacts(limit: 50)
            print("/facts from fake dataservice with any:\n\(mockedFacts2)")
        }
    }
    
    private func setupMocks() {
        Given(mockedCatDataService, .getFact(willReturn: .init(fact: "Frase finta sui gatti", length: 1000)))
        
        Given(
            mockedCatDataService,
              .getFacts(
                limit: 2,
                willReturn: [
                    .init(fact: "fatto 1", length: 1),
                    .init(fact: "fatto 2", length: 2)
                ]
              )
        )
        
        Given(
            mockedCatDataService,
              .getFacts(
                limit: .any,
                willReturn: [
                    .init(fact: "gatto 100", length: 1),
                    .init(fact: "gatto 200", length: 2),
                    .init(fact: "gatto 300", length: 2)
                ]
              )
        )
    }
}

enum Environment: String {
    case real = "Real"
    case mock = "Mock"
}