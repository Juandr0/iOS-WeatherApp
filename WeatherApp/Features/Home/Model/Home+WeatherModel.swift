//
//  HomeModel.swift
//  WeatherApp
//
//  Created by Alexander on 2024-07-16.
//

import Foundation

extension HomeView {
    struct WeatherModel: Codable {
        let location: Location
        let current: Current
        var forecast: Forecast
    }
    
    struct Location: Codable {
        let name: String
        let localtime_epoch: Int
    }
    
    struct Current: Codable {
        let temp_c: Double
        let condition: Condition
    }
    
    struct Condition: Codable {
        let text: String
        let icon: String
    }
    
    struct Forecast: Codable {
        var forecastday : [ForecastDay]
    }
    
    struct ForecastDay: Codable {
        let day: Day
        var hour : [Hour]
    }
    
    struct Day : Codable {
        let maxtemp_c : Double
        let mintemp_c : Double
        let uv : Int
        let maxwind_kph : Double
    }
    
    struct Hour: Codable {
        let temp_c : Double
        let condition : Condition
        let time_epoch : Int
        let time : String
        let chance_of_rain : Int
        let gust_kph : Double
    }
}
