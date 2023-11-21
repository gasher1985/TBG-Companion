//
//  RecentMaterialList.swift
//  TBG Companion App
//
//  Created by Dustin Franck on 8/15/23.
//

import SwiftUI

struct RecentMaterialList: View {
    
    var searchItem: String
    var materials = Materials()
    
    var filteredMaterials: [MaterialItem]
    
    var body: some View {
        VStack {
            Text("Recent Entries")
                .font(.title2)
                //check to see if search and empty and there are in the object
                if (searchItem.isEmpty && materials.items.count != 0) {
                    List {
                        //ForEach(materials.items.suffix(5)){ item in
                        ForEach(materials.items.suffix(5).reversed()){ item in
                            NavigationLink(value: item) {
                                MaterialListCard(material: item)
                            }
                        }
                        
                    }
                    .frame(height: 275)
                } else if(!searchItem.isEmpty && filteredMaterials.count != 0) {
                    List(filteredMaterials.suffix(5)){ item in
                        NavigationLink(value: item) {
                            MaterialListCard(material: item)
                        }
                    }
                    .frame(height: 300)
                } else if(!searchItem.isEmpty && filteredMaterials.count == 0) {
                    Text("No item found.")
                        .frame(height: 300)
                    
                } else {
                    Button("You haven't added any thing yet. Click to add material.") {
                        
                    }
                    .frame(height: 300)
                    
                }
            Spacer()
            Text("\(materials.items.count)")
        }
    }
}

#Preview {
    RecentMaterialList(searchItem: "", filteredMaterials: [MaterialItem(id: "test", name: "test1", isRoll: false, thickness: 0.0, length: 0.0, height: 0.0)])
}
