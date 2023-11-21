//
//  AddItem.swift
//  TBG Companion App
//
//  Created by Dustin Franck on 5/30/23.
//

import SwiftUI



struct AddItem: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @ObservedObject var materials: Materials
    @Binding var showsheet: Bool
    
    @State private var newItem = MaterialItem.emptyMaterial
    @State private var thicknessString = ""
    @State private var heightString = ""
    @State private var lengthString = ""
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Material Info")) {
                    TextField("Pace ID", text: $newItem.id)
                        .keyboardType(.decimalPad)
                    TextField("Material Name", text: $newItem.name)
                    Toggle(isOn: $newItem.isRoll) {
                        Text("Roll")
                    }
                }
                
                Section {
                    Group {
                        
                        TextField("Thickness", text: $thicknessString)
                        TextField("Height", text: $heightString)
                        TextField("Length", text: $lengthString)
                    }
                    .keyboardType(.decimalPad)
                    .ignoresSafeArea()
                    
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add") {
                        updateValues()
                        materials.items.append(newItem)
                        Materials().saveItem2DB(materialItem: newItem)
                        dismiss()
                    }
                }
            }
            /*.navigationBarItems(trailing: Button("Save") {
             updateValues()
             materials.items.append(newItem)
             dismiss()
             // Idk if this is proper way....
             }
             )*/
        }
    }
        private func updateValues() {
            newItem.thickness = Double(thicknessString) ?? 0
            newItem.height = Double(heightString) ?? 0
            newItem.length = Double(lengthString) ?? 0
        }
    
}

struct AddItem_Previews: PreviewProvider {
    
    static var previews: some View {
        AddItem(materials: Materials(), showsheet: .constant(false))
    }
}
