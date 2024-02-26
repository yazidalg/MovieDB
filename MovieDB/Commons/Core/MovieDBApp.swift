//
//  MovieDBApp.swift
//  MovieDB
//
//  Created by Yazid Al Ghozali on 21/02/24.
//

import SwiftUI

@main
struct MovieDBApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView(viewModel: HomeViewModel())
        }
    }
}
