//
//  Lab5DGApp.swift
//  Lab5DG
//
//  Created by student on 12/11/2024.
//

import SwiftUI

//@main
struct Lab5DGApp: App {
    var body: some Scene {
        WindowGroup {
            @StateObject var viewModel = MemoGameViewModel()
            ContentView()
        }
    }
}
