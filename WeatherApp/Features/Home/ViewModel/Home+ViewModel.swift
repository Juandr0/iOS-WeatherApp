//
//  ViewModel.swift
//  WeatherApp
//
//  Created by Alexander on 2024-07-16.
//
import Foundation

extension HomeView {
    class ViewModel: ObservableObject {
        @Published var weatherData: WeatherModel?
        @Published var isLoading: Bool = false
        @Published var locationManager = LocationManager()
        private let apiHandler = ApiHandler()

        init() {
            locationManager.onLocationUpdate = { [weak self] location in
                guard let self = self, let location = location else { return }
                self.fetchWeatherData(query: "\(location.latitude),\(location.longitude)")
            }
            locationManager.checkLocationAuthorization()
        }

        func fetchWeatherData(query: String) {
            isLoading = true
            apiHandler.fetchWeather(query: query) { [weak self] result in
                DispatchQueue.main.async {
                    switch result {
                    case .success(let weatherModel):
                        self?.weatherData = weatherModel
                    case .failure(let error):
                        print("Error fetching weather data: \(error)")
                    }
                    self?.isLoading = false
                }
            }
        }
    }
}

