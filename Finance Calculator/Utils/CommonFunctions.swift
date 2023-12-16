//
//  CommonFunctions.swift
//  Finance Calculator
//
//  Created by ABC on 12/6/20.
//

import Foundation
import UIKit

class CommonFunctions
{
    func getFormattedDecimalDouble(value: Double) -> Double
    {
        return (value * 100).rounded() / 100
    }
    
    func getFormattedDecimalString(value: Double) -> String
    {
        return String(format: "%.02f", value)
    }
}
