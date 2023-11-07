//
//  SwiftyApp.swift
//  Swifty
//
//  Created by D'Ante Watson on 11/6/23.
//

import SwiftUI

@main
struct SwiftyApp: App {
    var network = Network()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(network)
        }
    }
}
