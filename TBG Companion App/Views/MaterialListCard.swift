//
//  MaterialListCard.swift
//  TBG Companion App
//
//  Created by Dustin Franck on 6/25/23.
//

import SwiftUI

struct MaterialListCard: View {
    
    var material: MaterialItem
    
    var body: some View {
            HStack() {
                Text(material.name)
                Spacer()
                Label("\(material.thickness.formatted()) mm", systemImage: "ruler")
                
            }
            .padding(20)
            .frame(height: 30)
    }
}

struct MaterialListCard_Previews: PreviewProvider {
    static var previews: some View {
        MaterialListCard(material: MaterialItem(id: "1111", name: "Test", isRoll: false, thickness: 11.45, length: 12, height: 13))
    }
}
