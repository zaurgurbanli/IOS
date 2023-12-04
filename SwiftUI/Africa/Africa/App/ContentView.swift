//
//  ContentView.swift
//  Africa
//
//  Created by Zaur Gurbanli on 26.02.22.
//

import SwiftUI

struct ContentView: View {
    let animals: [Animal] = Bundle.main.decode("animals.json")
    let haptics = UIImpactFeedbackGenerator(style: .medium)
    
    @State private var isGridViewActive: Bool = false
    @State private var gridLayout: [GridItem] = [GridItem()]
    @State private var gridColumn: Int = 1
    @State private var toolbarIcon: String = "square.grid.2x2"
    
    
    func gridSwitch(){
        gridLayout = Array(repeating: .init(), count: gridLayout.count % 3 + 1)
        gridColumn = gridLayout.count
        
        switch gridColumn {
        case 1:
            toolbarIcon = "square.grid.2x2"
        case 2:
            toolbarIcon = "square.grid.3x2"
        case 3:
            toolbarIcon = "rectangle.grid.1x2"
        default:
            toolbarIcon = "square.grid.2x2"
        }
    }
    
    
    var body: some View {
        NavigationView{
            Group{
                if !isGridViewActive {
                    List{
                        CoverImageView()
                            .frame(height: 300)
                            .listRowInsets(EdgeInsets(.zero))
                        
                        ForEach(animals){ animal in
                            NavigationLink(destination: AnimalDetailView(animal: animal)){
                                AnimalListItemVIew(animal: animal)
                            }
                        }
                    }
                } else {
                    ScrollView(.vertical, showsIndicators: false) {
                        LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                            ForEach(animals) { animal in
                                NavigationLink(destination: AnimalDetailView(animal: animal)){
                                    AnimalGridItemView(animal: animal)
                                }
                            }
                        }
                        .padding(10)
                    }
                }
            }
            .listStyle(.inset)
            .navigationTitle("Africa")
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    HStack(spacing:16){
                        Button {
                            isGridViewActive = false
                            haptics.impactOccurred()
                        } label: {
                            Image(systemName: "square.fill.text.grid.1x2")
                                .font(.title3)
                                .foregroundColor(isGridViewActive ? .primary : .accentColor)
                        }
                        Button {
                            isGridViewActive = true
                            haptics.impactOccurred()
                            withAnimation(.easeIn){
                                gridSwitch()
                            }
                        } label: {
                            Image(systemName: toolbarIcon)
                                .font(.title3)
                                .foregroundColor(isGridViewActive ? .accentColor :  .primary)
                        }

                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
