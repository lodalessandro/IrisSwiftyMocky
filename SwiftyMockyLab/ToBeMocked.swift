//
//  ToBeMocked.swift
//  SwiftyMockyLab
//
//  Created by Lorenzo on 26/05/24.
//

import Foundation
import SwiftyMocky

protocol StringToInt: AutoMockable {
    func returnString(for number: Int) -> String
}

struct StringToIntImplementation: StringToInt {
    func returnString(for number: Int) -> String {
        return String(number)
    }
}
