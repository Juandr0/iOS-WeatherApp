//
//  GlassView.swift
//  WeatherApp
//
//  Created by Alexander on 2024-07-15.
//

import SwiftUI

extension HomeView {
    struct GlassView: View {
        @ObservedObject var viewModel: ViewModel
        
        var body: some View {
            ScrollView{
                VStack(spacing: 20){
                    ScrollViewReader { scrollProxy in
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 8) {
                                ForEach(viewModel.weatherData?.forecast.forecastday[0].hour ?? [], id: \.time) { forecastHour in
                                    let formattedTime = String.lazyDateFormatter(for: forecastHour.time)
                                    ForecastCard(
                                        time: formattedTime,
                                        imageUrl: forecastHour.condition.icon,
                                        degrees: Int16(forecastHour.temp_c),
                                        rainChance: forecastHour.chance_of_rain
                                    )
                                    .frame(height: 150)
                                    .cornerRadius(15)
                                    .id(formattedTime)
                                }
                            }
                            .padding(.horizontal, 10)
                            .onAppear{
                                withAnimation{
                                    scrollProxy.scrollTo(mostRecentHour, anchor: .center)
                                }
                            }
                        }
                    }
                    .padding(.top, 20)
                    Text("Daily maximum")
                        .foregroundStyle(.white)
                        .font(.title2)
                    HStack {
                        HomeView.InfoRectangle(
                            title: "Wind",
                            displayValue: String(format: "%.1f km/h", viewModel.weatherData?.forecast.forecastday[0].day.maxwind_kph ?? 0),
                            imageSystemName: "wind"
                        )
                        Spacer()
                        HomeView.InfoRectangle(
                            title: "UV",
                            displayValue: String( viewModel.weatherData?.forecast.forecastday[0].day.uv ?? 0),
                            imageSystemName: "burn"
                        )
                    }
                }
            }
            .ignoresSafeArea()
            .padding(0)
            .background(.clear)
        }
        
        private var mostRecentHour: String {
            let dateNow = Date()
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "HH:00"
            return dateFormatter.string(from: dateNow)
        }
    }
}

#Preview {
    HomeView.GlassView(viewModel: HomeView.ViewModel())
        .background(
            Image("Background")
                .resizable()
                .ignoresSafeArea(.all)
        )
}

