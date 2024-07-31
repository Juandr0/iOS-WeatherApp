//
//  URLSession+Fetching.swift
//  WeatherApp
//
//  Created by Alexander on 2024-07-24.
//

import Foundation

extension URLSession {
    func fetchData<T: Decodable> (from url: URL, completion: @escaping (Result<T, Error>) -> Void) {
    self.dataTask(with: url) { (data, response, error) in
      if let error = error {
        completion(.failure(error))
      }

      if let data = data {
        do {
          let decodedData = try JSONDecoder().decode(T.self, from: data)
          completion(.success(decodedData))
        } catch let decoderError {
          completion(.failure(decoderError))
        }
      }
    }.resume()
  }
}
