//
//  WeatherManager.swift
//  Clima
//
//  Created by Alandis Seals on 1/3/21.
//  Copyright © 2021 App Brewery. All rights reserved.
//

import Foundation

struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?&units=fahrenheit&appid=ac0ace4dc9d9bd0646f4e1bc33c057ff"
    
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String){
       if let url = URL(string: urlString){
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url, completionHandler: handle(data: response: err:))
        
        task.resume()
        }
    }
    
    func handle(data: Data?, response: URLResponse?, err: Error?) {
        if err != nil {
            print(err!)
            return
        }
        if let safeData = data {
            let dataString = String(data: safeData, encoding: .utf8)
            print(dataString)
        }
    }
}
