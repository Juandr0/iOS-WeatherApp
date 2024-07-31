//
//  Home+ForecastCard.swift
//  WeatherApp
//
//  Created by Alexander on 2024-07-24.
//

import SwiftUI

extension HomeView {
    struct ForecastCard: View {
        let time : String
        let imageUrl : String
        let degrees : Int16
        let rainChance : Int
        
        private var formattedUrl: URL {
            let prefix = "https:"
            return URL(string: prefix + imageUrl)!
        }
        
        var body: some View {
            VStack {
                Text(time)
                    .foregroundStyle(.white)
                    .font(.subheadline)
                    .padding(.top, 10)
                Spacer()
                AsyncImage(url: formattedUrl){ phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFit()
                    case .failure:
                        Image(systemName: "exclamationmark.triangle.fill")
                            .foregroundColor(.red)
                    @unknown default:
                        EmptyView()
                    }
                }
                Text(String(rainChance) + " %")
                    .foregroundStyle(.cyan)
                    .font(.subheadline)
                    .padding(.horizontal, 5)
                Spacer()
                Text("\(degrees)°")
                    .font(.title2)
                    .foregroundStyle(.white)
                    .padding(.bottom, 10)
            }
            .background(Color.indigo.opacity(0.4))
        }
    }
}
