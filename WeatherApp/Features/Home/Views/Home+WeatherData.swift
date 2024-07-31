//
//  Home+WeatherData.swift
//  WeatherApp
//
//  Created by Alexander on 2024-07-24.
//
import SwiftUI

extension HomeView {
    struct WeatherData : View {
        let weatherData : HomeView.WeatherModel
        
        var body: some View {
            VStack {
                Text(weatherData.location.name)
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                Text(String(format: "%.1f°", weatherData.current.temp_c))
                    .font(.system(size: 90))
                    .foregroundStyle(.white)
                Text(weatherData.current.condition.text)
                    .font(.title)
                    .foregroundStyle(.gray)
                HStack {
                    Text(String(format: "L: %.1f°", weatherData.forecast.forecastday[0].day.mintemp_c))
                        .font(.title2)
                        .foregroundStyle(.white)
                        .padding(.trailing)
                    Text(String(format: "H: %.1f°", weatherData.forecast.forecastday[0].day.maxtemp_c))
                        .font(.title2)
                        .foregroundStyle(.white)
                }
            }
        }
    }
}
