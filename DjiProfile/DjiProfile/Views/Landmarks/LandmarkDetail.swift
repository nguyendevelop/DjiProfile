//
//  LandmarkDetail.swift
//  DjiProfile
//
//  Created by Nguyen Dang Quy on 26/03/2022.
//

import SwiftUI
import MapKit

struct LandmarkDetail: View {
    @EnvironmentObject var modelData: ModelData
    var landmark: Landmark
    
//    @State private var region = MKCoordinateRegion(
//            center: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868),
//            span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
//        )
    
    //liên kết thuộc tính của nút thích của từng mốc nhất định
    var landmarkIndex: Int {
        modelData.landmarks.firstIndex(where: { $0.id == landmark.id })!
    }
    
    var body: some View {
        
        //VStack {
        ScrollView {
        
//            Map(coordinateRegion: $region)
            MapView(coordinate: landmark.locationCoordinate)
                .ignoresSafeArea(edges: .top)
                .frame(height: 300)
            
//            Image("avatar1")
//                .clipShape(Circle())
//                .overlay {
//                    Circle().stroke(.white, lineWidth: 4)
//                }
//                .shadow(radius: 7)
//                .offset(y: -130)
//                .padding(.bottom, -150)
//                .ignoresSafeArea(edges: .top)
            CircleImage(image: landmark.image)
                .offset(y: -130)
                .padding(.bottom, -130)
                
            
            VStack(alignment: .center) {
//                Text("Nguyễn Develop")
//                    .font(.title)
//                    .fontWeight(.bold)
//                    .foregroundColor(Color.blue)
//                    .padding()
                Text(landmark.name)
                    .font(.title)
                
                HStack{
//                    Text("Intro")
//                    Text("About")
//                    Text("Certificates")
//                    Text("Photo")
//                    Text("Contact")
                    
                    Text(landmark.name)
                        .font(.title)
                    
                    FavoriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)
                }
                .font(.subheadline)
                .foregroundColor(.secondary)

                
                Divider()
                
//                Text("\tLorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.")
//                    .font(.caption)
                Text("About \(landmark.name)")
                    .font(.title2)
                    .padding()
                Text(landmark.description)
                    .multilineTextAlignment(.center)
            }
            //Thay đổi tiêu đề mỗi lần điều hướng
            .navigationTitle(landmark.name)
            .navigationBarTitleDisplayMode(.inline)
            
            .padding()
            
            Spacer()
        }
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
//        LandmarkDetail(landmark: landmarks[0])
        
        LandmarkDetail(landmark: ModelData().landmarks[0])
            .environmentObject(modelData)

    }
}
