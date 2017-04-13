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
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .long
            dateFormatter.timeStyle = .none
            let currentDate = dateFormatter.string(from: Date())
            self._date = "Today, \(currentDate)"
            
        }
        
        return _date
        
    }
    
    func downloadWeatherData(completed: DownloadComplete){
        
        let currentWeatherURL = URL(string: WEATHER_URL)
        
        Alamofire.request(currentWeatherURL!).responseJSON { response in
            
            print(response.request)  // original URL request
            print(response.response) // HTTP URL response
            print(response.data)     // server data
            print(response.result)   // result of response serialization
            
            if let JSON = response.result.value {
                print("JSON: \(JSON)")
            }
            
        }
        completed()
        
        
    }
    
    
    
}
