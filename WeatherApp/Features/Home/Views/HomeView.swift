//
//  HomeView.swift
//  WeatherApp
//
//  Created by Alexander on 2024-07-15.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel : HomeView.ViewModel
    @State var isSheetPresented = true
    
    var body: some View {
        ZStack {
            Image("Background")
                .resizable()
                .ignoresSafeArea(.all)
            Image("House")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.top, 180)
            VStack {
                if let weatherData = viewModel.weatherData {
                    WeatherData(weatherData: weatherData)
                }
                Spacer()
            }
            .padding(.top, 20)
        }
        .sheet(isPresented: $isSheetPresented) {
            if viewModel.weatherData != nil {
                WeatherModalView(viewModel: viewModel)
            } else {
                ProgressView()
                    .interactiveDismissDisabled()
                    .progressViewStyle(.circular)
                    .presentationDetents([.height(.leastNonzeroMagnitude), .medium])
            }
        }
    }
}




#Preview {
    HomeView(viewModel: HomeView.ViewModel())
}
