//
//  Measurements.swift
//  TBG Companion App
//
//  Created by Dustin Franck on 5/24/23.
//

import Foundation

struct Measurements {
    
    func squareFeet(length: Double, height: Double)-> Double {
        return length * height / 144
    }
    
    func inchToMM(number: Double) -> Double {
        return number * 25.4
    }
    
    func mmToInch(number: Double) -> Double {
        return number / 25.4
    }
    
}
