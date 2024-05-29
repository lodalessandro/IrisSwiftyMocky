//
//  ExampleDataService.swift
//  SwiftyMockyLab
//
//  Created by Lorenzo on 27/05/24.
//

import Foundation
import SwiftyMocky

protocol ExampleDataService: AutoMockable {
    func networkCall()
}

struct ExampleDataServiceImplemention: MockableDataService, ExampleDataService {
    
    typealias DataService = ExampleDataService
    
    static var sharedInstance: DataService = ExampleDataServiceImplemention()
    static var mockedSharedInstance: DataService = ExampleDataServiceMock()
        
    func setupMocks() {}
    func networkCall() {}
}

struct ChuckNorrisJoke: Codable {
    let categories: [String]
    let createdAt: String
    let iconURL: String
    let id: String
    let updatedAt: String
    let url: String
    let value: String
}
