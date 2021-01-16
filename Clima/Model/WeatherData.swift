//
//  WeatherData.swift
//  Clima
//
//  Created by Alandis Seals on 1/14/21.
//  Copyright © 2021 App Brewery. All rights reserved.
//

import Foundation


struct WeatherData: Decodable {
    
    let name: String
    let main: Main
    let weather: [Weather]
    let timeZone: Int
    
}

struct Main: Decodable {
    let temp: Double
}

struct Weather:Decodable {
    let description: String
}


