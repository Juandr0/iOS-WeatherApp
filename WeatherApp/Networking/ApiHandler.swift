//
//  ApiHandler.swift
//  WeatherApp
//
//  Created by Alexander on 2024-07-31.
//

import Foundation

struct ApiHandler {
    var query = ""
    var amountOfDays = 2
    
    private let apiKey = "8bf2c45ef8c347b28c0124111233007"
    private let baseUrl = "https://api.weatherapi.com/v1/forecast.json"
    
    func fetchWeather(query: String, completion: @escaping (Result<HomeView.WeatherModel, Error>) -> Void) {
        guard let url = URL(string: "\(baseUrl)?key=\(apiKey)&q=\(query)&days=\(amountOfDays)") else {
            completion(.failure(URLError(.badURL)))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(URLError(.cannotParseResponse)))
                return
            }
            
            do {
                let weatherModel = try JSONDecoder().decode(HomeView.WeatherModel.self, from: data)
                if self.amountOfDays == 2 {
                    guard let secondDayFirstHour = weatherModel.forecast.forecastday[1].hour.first else {
                        completion(.success(weatherModel))
                        return
                    }
                    var updatedWeatherModel = weatherModel
                    updatedWeatherModel.forecast.forecastday[0].hour.append(secondDayFirstHour)
                    completion(.success(updatedWeatherModel))
                } else {
                    completion(.success(weatherModel))
                }
            } catch {
                completion(.failure(error))
            }
        }
        
        task.resume()
    }
}

