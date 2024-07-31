//
//  MaxUvView.swift
//  WeatherApp
//
//  Created by Alexander on 2024-07-29.
//

import SwiftUI

extension HomeView {
    struct MaxUvView: View {
        
        let maxUv : Int
        var body: some View {
            VStack {
                Text(String(maxUv))
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(LinearGradient(colors: [.blue.opacity(0.5), .indigo.opacity(0.7)], startPoint: .topLeading, endPoint: .bottomTrailing))
            .clipShape(RoundedRectangle(cornerRadius: 20))
            
        }
    }
}


#Preview {
    HomeView.MaxUvView(maxUv: 5)
}
