//
//  String+LazyDateFormatter.swift
//  WeatherApp
//
//  Created by Alexander on 2024-07-24.
//

import Foundation

extension String {
    static func lazyDateFormatter(for time : String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        
        guard let date = dateFormatter.date(from: time) else {
            return ""
        }
        
        dateFormatter.dateFormat = "HH:mm"
        return dateFormatter.string(from: date)
    }
}
