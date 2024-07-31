//
//  Home+MaxWindView.swift
//  WeatherApp
//
//  Created by Alexander on 2024-07-29.
//

import SwiftUI

extension HomeView {
    struct InfoRectangle: View {
        let title : String
        let displayValue : String
        let imageSystemName : String
        
        var body: some View {
            VStack(spacing: 0) {
                Text(title)
                    .font(.title3)
                    .foregroundStyle(.white)
                VStack(spacing: 10) {
                    Image(systemName: imageSystemName)
                        .foregroundStyle(.white)
                        .font(.system(size: 30))
                    Text(displayValue)
                        .font(.title2)
                        .foregroundStyle(.white)
                }
                .padding(20)
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
                .background(LinearGradient(colors: [.blue.opacity(0.5), .indigo.opacity(0.7)], startPoint: .topLeading, endPoint: .bottomTrailing))
                
            .clipShape(RoundedRectangle(cornerRadius: 20))
            }
        }
    }
}


#Preview {
    HomeView.InfoRectangle(
        title: "Wind",
        displayValue: "20",
        imageSystemName: "wind"
    )
        .background(.black)
}
