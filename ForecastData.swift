//
//  ForecastData.swift
//  RainyShine
//
//  Created by Solomon Rajkumar on 19/04/17.
//  Copyright © 2017 Solomon Rajkumar. All rights reserved.
//

import Foundation
import Alamofire

class ForecastData {
    
    var _minTemp: String!
    var _maxTemp: String!
    var _weatherType: String!
    var weatherForecasts = [ForecastData]()
    
    var minTemp: String {
        
        if _minTemp == nil {
            _minTemp = ""
        }
        return _minTemp
        
    }
    
    var maxTemp: String {
        
        if _maxTemp == nil {
            _maxTemp = ""
        }
        return _maxTemp
        
    }
    
    var weatherType: String {
        
        if _weatherType == nil {
            _weatherType = ""
        }
        return _weatherType
        
    }
    
    func downloadWeatherForecastData(completed: @escaping DownloadComplete){
        
        let currentWeatherForecastURL = URL(string: FORECAST_URL)
        
        Alamofire.request(currentWeatherForecastURL!).responseJSON { response in
            
            if let weatherDataDictionary = response.result.value as? Dictionary<String, AnyObject> {
                
                if let forecastDetails = weatherDataDictionary["list"] as? [Dictionary<String, AnyObject>] {
                    
                    for forecastDetail in forecastDetails {
                        
                        let forecastDataObj = ForecastData()
                        
                        if let temperatureData = forecastDetail["temp"] as? Dictionary<String, AnyObject> {
                            
                            if let minTemperature = temperatureData["min"] as? Double {
                                //print(minTemperature)
                                forecastDataObj._minTemp = "\(minTemperature)"
                            }
                            
                            if let maxTemperature = temperatureData["max"] as? Double {
                                //print(maxTemperature)
                                forecastDataObj._maxTemp = "\(maxTemperature)"
                            }
                            
                        }
                        
                        if let weatherTypeData = forecastDetail["weather"] as? [Dictionary<String, AnyObject>] {
                            
                            if let weatherType = weatherTypeData[0]["main"] as? String {
                                //print(weatherType)
                                forecastDataObj._weatherType = weatherType
                            }
                            
                        }
                        //print(forecastDataObj.maxTemp)
                        //print(forecastDataObj.minTemp)
                        //print(forecastDataObj.weatherType)
                        self.weatherForecasts.append(forecastDataObj)
                        
                    }
                    print(self.weatherForecasts.count)
                    
                }

            }
            
        }
        
    }
    
}
