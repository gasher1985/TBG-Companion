//
//  Misc.swift
//  TBG Companion App
//
//  Created by Dustin Franck on 7/10/23.
//

import SwiftUI


struct Misc {
    static func CloseKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
