//
//  MaterialDetailView.swift
//  TBG Companion App
//
//  Created by Dustin Franck on 8/8/23.
//

import SwiftUI

struct MaterialDetailView: View {
    
    let material: MaterialItem
    
    var twoThirdsWidth: CGFloat {
        let screenWidth = UIScreen.main.bounds.width
        return screenWidth * 2 / 3
    }
    
    
    var body: some View {
        
        Text("ID: \(material.id)")
            .frame(width: twoThirdsWidth, height: 15)
            .background(.green)
        VStack(alignment: .leading, spacing: 10) {
            Text("Name: \(material.name)")
            Text("Is Roll: \(material.isRoll ? "Yes" : "No")")
            Text("Thickness: \(material.thickness.formatted()) mm")
            Text("Length: \(material.length.formatted()) in")
            Text("Height: \(material.height.formatted()) in")
        }
        .padding()
        .font(.title3)
    }
}

#Preview {
    MaterialDetailView(material: MaterialItem.emptyMaterial)
}
