//
//  ChopApp.swift
//  Chop
//
//  Created by Marvin Kome on 29.02.24.
//

import SwiftUI
import SwiftData

@main
struct ChopApp: App {
    @State private var model = AppModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .environment(model)
    }
}
