//
//  ContentView.swift
//  DjiProfile
//
//  Created by Nguyen Dang Quy on 23/03/2022.
//

import SwiftUI
import MapKit

struct ContentView: View {
    
    @State private var region = MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868),
            span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        )
    
    var body: some View {
        
        VStack {
            Map(coordinateRegion: $region)
            
            Image("avatar1")
                .clipShape(Circle())
                .overlay {
                    Circle().stroke(.white, lineWidth: 4)
                }
                .shadow(radius: 7)
                
            
            VStack(alignment: .leading) {
                Text("Nguyễn Develop")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color.blue)
                
                HStack{
                    Text("Intro")
                        .font(.subheadline)
                    Text("About")
                        .font(.subheadline)
                    Text("Certificates")
                        .font(.subheadline)
                    Text("Photo")
                        .font(.subheadline)
                    Text("Contact")
                        .font(.subheadline)
                }
                
                
                
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
