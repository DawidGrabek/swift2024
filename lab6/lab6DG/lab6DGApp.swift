//
//  lab6DGApp.swift
//  lab6DG
//
//  Created by student on 26/11/2024.
//

import SwiftUI

//@main
//@main
struct lab6DGApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
            @StateObject var viewModel = MemoGameViewModel()
        }
    }
}
