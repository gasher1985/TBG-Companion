//
//  ContentView.swift
//  TBG Companion App
//
//  Created by Dustin Franck on 5/24/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var searchItem = ""
    @State var showSheet = false
    
    @StateObject var materials = Materials()
    
    var filteredMaterials: [MaterialItem] {
        if searchItem.isEmpty {
            return materials.items
        }
        
        var uniqueMaterials: [MaterialItem] = []
        var uniqueMaterialIDs: Set<String> = []
        
        for item in materials.items {
            if item.id.contains(searchItem) && !uniqueMaterialIDs.contains(item.id) {
                uniqueMaterials.append(item)
                uniqueMaterialIDs.insert(item.id)
            }
        }
        
        return uniqueMaterials
    }
    
    var body: some View {
        
        NavigationStack {
            /*VStack {
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
            }*/
            RecentMaterialList(searchItem: searchItem, filteredMaterials: filteredMaterials)
            .searchable(text: $searchItem, placement: .navigationBarDrawer(displayMode: .always))
            .toolbar {
                Button("Add") {
                    showSheet = true
                }
            }
            .sheet(isPresented: $showSheet){
                AddItem(materials: materials, showsheet: $showSheet)
            }
            
            .navigationDestination(for: MaterialItem.self){ materials in
                MaterialView(material: materials)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(Materials())
    }
}
