//
//  NetworkService.swift
//  MovieBox
//
//  Created by Bilal Akram on 7/22/25.
//

import Foundation
import Combine

class NetworkService {
    func request<T: Decodable>(_ url: URL) -> AnyPublisher<T, Error> {
        return URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .background))
            .tryMap { data, response in
                guard let httpResponse = response as? HTTPURLResponse,
                      (200...299).contains(httpResponse.statusCode) else {
                    throw URLError(.badServerResponse)
                }
                print(String(data: data, encoding: .utf8) ?? "No readable data")
                return data
            }
            .receive(on: DispatchQueue.main)
            .decode(type: T.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}

