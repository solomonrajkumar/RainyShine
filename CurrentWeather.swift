//
//  CurrentWeather.swift
//  RainyShine
//
//  Created by Solomon Rajkumar on 13/04/17.
//  Copyright © 2017 Solomon Rajkumar. All rights reserved.
//

import UIKit
import Alamofire

class CurrentWeather {
    
    var _cityName: String!
    var _date: String!
    var _weatherType: String!
    var _currentTemperature: String!
    
    var cityName: String {
        
        if _cityName == nil {
            _cityName = ""
        }
        
        return _cityName
        
    }
    
    var weatherType: String {
        
        if _weatherType == nil {
            _weatherType = ""
        }
        
        return _weatherType
        
    }
    
    var currentTemperature: String {
        
        if _currentTemperature == nil {
            _currentTemperature = ""
        }
        
        return _currentTemperature
        
    }
    
    var date: String {
        
        if _date == nil {
            _date = ""
            
        }
        else {
            
            // set the current date
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .long
            dateFormatter.timeStyle = .none
            let currentDate = dateFormatter.string(from: Date())
            self._date = "Today, \(currentDate)"
            
        }
        
        return _date
        
    }
    
    func downloadWeatherData(completed: @escaping DownloadComplete){
        
        let currentWeatherURL = URL(string: WEATHER_URL)
        
        Alamofire.request(currentWeatherURL!).responseJSON { response in
            
            if let weatherDataDictionary = response.result.value as? Dictionary<String, AnyObject> {
                
                // set cityName
                if let cityName = weatherDataDictionary["name"] as? String {
                    self._cityName = cityName.capitalized
                }
                
                // set weather Type
                if let weather = weatherDataDictionary["weather"] as? [Dictionary<String,AnyObject>] {
                    let weatherType = weather[0]["main"] as! String
                    self._weatherType = weatherType.capitalized
                }
                
                // set current temperature
                if let main = weatherDataDictionary["main"] as? Dictionary<String, AnyObject> {
                    let temperature = main["temp"] as! Double
                    let temperatureInCelsius = Int(round(temperature - 273.15))
                    self._currentTemperature = "\(temperatureInCelsius)°"
                }
                
            }
            
            completed()
        }
        
        
        
    }
    
    
    
}
