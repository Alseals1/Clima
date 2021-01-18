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
        //Step 1: Create a URL
       if let url = URL(string: urlString){
        
        
        //Step2: Create a URL Session
        let session = URLSession(configuration: .default)
        
        
        //Step 3: Give URL a task
        let task = session.dataTask(with: url) { (data, response, error) in
            if error != nil {
                print(error!)
                return
        }
            if let safeData = data {
                self.parseJSON(weatherData: safeData)
            }
        
        }
        //Step 4: Start Task
        task.resume()
        }
    }
    
    func parseJSON(weatherData: Data){
        let decoder = JSONDecoder()
        
        do {
           let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
           let id = (decodedData.weather[0].id )
            let temp = decodedData.main.temp
            let name = decodedData.name
            let weather = WeatherModel(conditionId: id, name: name, temp: temp)
            print(weather.tempatureString)
            
        } catch {
            print(error)
        }
    }
    
 
    }

