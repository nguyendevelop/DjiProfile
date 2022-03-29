//
//  CategoryItem.swift
//  DjiProfile
//
//  Created by Nguyen Dang Quy on 30/03/2022.
//

import SwiftUI

struct CategoryItem: View {
    var landmark: Landmark
    
    var body: some View {
        VStack(alignment: .leading) {
            landmark.image
                .renderingMode(.original)
                .resizable()
                .frame(width: 185, height: 155)
                .cornerRadius(5)
            Text(landmark.name)
                .foregroundColor(.primary)
                .font(.caption)
        }
        .padding()
    }
}

struct CategoryItem_Previews: PreviewProvider {
    static var previews: some View {
        CategoryItem(landmark: ModelData().landmarks[0])
    }
}
