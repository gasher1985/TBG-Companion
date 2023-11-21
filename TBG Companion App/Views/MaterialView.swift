//
//  MaterialView.swift
//  TBG Companion App
//
//  Created by Dustin Franck on 7/4/23.
//

import SwiftUI

struct MaterialView: View {
    var material: MaterialItem
    var helper = Measurements()
    
    @State var boards = ""
    
    var twoThirdsWidth: CGFloat {
        let screenWidth = UIScreen.main.bounds.width
        return screenWidth * 2 / 3
    }
    
    var body: some View {

        NavigationView {
            VStack {
                
                Text("Material Details")
                    .font(.title)
                    .padding(.bottom)
                Spacer()
                
                MaterialDetailView(material: material)
                
                VStack {
                    
                        VStack{
                            Text("Helper Info").font(.title)
                                .padding(.bottom)
                            HStack{
                                Text("Dimensions in mm")
                                Spacer()
                                Text("\(helper.inchToMM(number: material.length).formatted()) x \(helper.inchToMM(number: material.height).formatted())")
                                
                            }
                            .padding(.bottom)
                            HStack{
                                Text("Square Feet")
                                Spacer()
                                Text("\(String(format: "%.2f", helper.squareFeet(length: material.length, height: material.height)))")
                                
                            }
                            .padding(.bottom)
                            HStack{
                                TextField("Enter # of boards", text: $boards)
                                    .keyboardType(.decimalPad)
                                Spacer()
                                
                                Text("Total sq ft: \(helper.squareFeet(length: material.length, height: material.height * (Double($boards.wrappedValue) ?? 0)).formatted())")
                                    .fixedSize(horizontal: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/, vertical: false)
                            }
                            Spacer()
                            /*HStack {
                                Spacer()
                                Button("Delete") {
                                    
                                }
                                .font(.title)
                                .buttonStyle(.bordered)
                                .background(.red)
                                .cornerRadius(10)
                                .padding()
                            }*/
                        }
                        .font(.title3)
                        .padding()
                    
                }
                .padding()
            }
            
        }
        .toolbar {
            ToolbarItemGroup(placement: .keyboard){
                Spacer()
                Button("Return") {
                    Misc.CloseKeyboard()
                }
            }
            ToolbarItemGroup(placement: .navigation) {
                Button("Test") {
                    
                }
            }
        }
    }
}

#Preview {
    MaterialView(material: MaterialItem(id: "1", name: "Material A", isRoll: true, thickness: 2.5, length: 10.0, height: 5.0))
}
