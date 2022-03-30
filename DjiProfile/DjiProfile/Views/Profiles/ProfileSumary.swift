//
//  ProfileSumary.swift
//  DjiProfile
//
//  Created by Nguyen Dang Quy on 30/03/2022.
//

import SwiftUI

struct ProfileSumary: View {
    @EnvironmentObject var modelData: ModelData
    var profile: Profile
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                Text(profile.username)
                    .bold()
                    .font(.title)
                
                Text("Notifications: \(profile.prefersNotifications ? "On" : "Off" )")
                Text("Seasonal Photos: \(profile.seasonalPhoto.rawValue)")
                Text("Goal Data: ") + Text(profile.goalDate, style: .date)
                
                Divider()
                
                //Cập nhật huy hiệu
                VStack(alignment: .leading) {
                    Text("Completed Badges")
                        .font(.headline)
                    
                    ScrollView(.horizontal) {
                        HStack {
                            HikeBadge(name: "First Hike")
                            HikeBadge(name: "Earth Day")
                                .hueRotation(Angle(degrees: 90))
                            HikeBadge(name: "Tenth Hike")
                                .grayscale(0.5)
                                .hueRotation(Angle(degrees: 45))
                        }
                        .padding(.bottom)
                    }
                }
                
                Divider()
                
                //add Hikes
                VStack(alignment: .leading) {
                    Text("Recent Hikes")
                        .font(.headline)
                    
                    HikeView(hike: modelData.hike[0])
                }
            }
        }
    }
}

struct ProfileSumary_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSumary(profile: Profile.default)
            .environmentObject(ModelData())
    }
}
