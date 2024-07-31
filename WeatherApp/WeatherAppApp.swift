//
//  WeatherAppApp.swift
//  WeatherApp
//
//  Created by Alexander on 2024-07-15.
//

import SwiftUI

@main
struct WeatherAppApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView(
                viewModel: HomeView.ViewModel()
            )
        }
    }
}
