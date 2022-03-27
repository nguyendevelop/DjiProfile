//
//  DjiProfileApp.swift
//  DjiProfile
//
//  Created by Nguyen Dang Quy on 23/03/2022.
//

import SwiftUI

@main
struct DjiProfileApp: App {
    @StateObject private var modelData = ModelData()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
