//
//  Configuration.swift
//  MovieBox
//
//  Created by Bilal Akram on 8/7/25.
//

import Foundation

enum Configuration {
    static var baseURL: String {
        return Bundle.main.infoDictionary?["BASE_URL"] as? String ?? ""
    }

    static var apiKey: String {
        return Bundle.main.infoDictionary?["API_KEY"] as? String ?? ""
    }
}

