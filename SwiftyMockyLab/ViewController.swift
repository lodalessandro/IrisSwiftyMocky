//
//  ViewController.swift
//  SwiftyMockyLab
//
//  Created by Lorenzo on 26/05/24.
//

import UIKit
import SwiftyMocky

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let mock: StringToInt = StringToIntMock()
        let real: StringToInt = StringToIntImplementation()
        
        Given(mock as! StringToIntMock, .returnString(for: 3, willReturn: "tre"))
        Given(mock as! StringToIntMock, .returnString(for: 10, willReturn: "dieci"))
        Given(mock as! StringToIntMock, .returnString(for: .any, willReturn: "Any"))
        
        print(mock.returnString(for: 3))
        print(mock.returnString(for: 10))
        print(mock.returnString(for: 100))
        print(real.returnString(for: 100))
    }
}
