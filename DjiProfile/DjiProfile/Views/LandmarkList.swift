//
//  LandmarkList.swift
//  DjiProfile
//
//  Created by Nguyen Dang Quy on 26/03/2022.
//

import SwiftUI

struct LandmarkList: View {
    @State private var showFavoritesOnly = false
    
    var body: some View {
//        List {
//            LandmarkRow(landmark: landmarks[0])
//            LandmarkRow(landmark: landmarks[1])
//        }

//        List(landmarks, id: \.id) { landmark in
//            LandmarkRow(landmark: landmark)
//        }
        
        NavigationView {
            List(landmarks) { landmark in
                NavigationLink {
                    LandmarkDetail(landmark: landmark)
                } label: {
                    LandmarkRow(landmark: landmark)
                }
            }
            .navigationTitle("Landmarks")
        }
        
    }
}



struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        
        //Previews kích thước của iPhone SE
//            .previewDevice(PreviewDevice(rawValue: "iPhone SE (2nd generation)"))
        ForEach(["iPhone SE (2nd generation)", "iPhone XS Max", "iPad Pro (12.9-inch) (5th generation)"], id: \.self) { deviceName in
            LandmarkList()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
        
//        LandmarkList()
    }
}
