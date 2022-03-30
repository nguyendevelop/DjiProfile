//
//  CategoryHome.swift
//  DjiProfile
//
//  Created by Nguyen Dang Quy on 30/03/2022.
//

import SwiftUI

struct CategoryHome: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showingProfile = false
    
    var body: some View {
        NavigationView {
            List {
//                modelData.features[0].image
//                    .resizable()
//                    .scaledToFit()
//                    .frame(height: 200)
//                    .clipped()
//                    //mở rộng view đến sát cạnh màn hình
//                    .listRowInsets(EdgeInsets())
                PageView(pages: modelData.features.map { FeatureCard(landmark: $0) })
                    .aspectRatio(3 / 2, contentMode: .fit)
                    .listRowInsets(EdgeInsets())
                
                ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
                    CategoryRow(categoryName: key, items: modelData.categories[key]!)
                }
                .listRowInsets(EdgeInsets())
            }
            //full view căn view đến góc màn hình
            .listStyle(.inset)
            .navigationTitle("Featured")
            //add button profile
            .toolbar {
                Button {
                    showingProfile.toggle()
                } label: {
                Label("User Profile", systemImage: "person.crop.circle")
                }
            }
            .sheet(isPresented: $showingProfile) {
                ProfileHost()
                    .environmentObject(modelData)
            }
        }
    }
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
            .environmentObject(ModelData())
    }
}
