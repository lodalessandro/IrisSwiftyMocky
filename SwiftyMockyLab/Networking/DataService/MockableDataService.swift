//
//  MockableDataService.swift
//  SwiftyMockyLab
//
//  Created by Lorenzo on 27/05/24.
//

import Foundation
import SwiftyMocky

protocol MockableDataService {
    
    associatedtype DataService
    
    static var sharedInstance: DataService { get set }
    static var mockedSharedInstance: DataService { get set }
    
    static func getInstance(isMocked: Bool) -> DataService
    func setupMocks()
}

extension MockableDataService {
    static func getInstance(isMocked: Bool) -> DataService {
        return isMocked ? mockedSharedInstance : sharedInstance
    }
}
