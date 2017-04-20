//
//  RainyShineViewController.swift
//  RainyShine
//
//  Created by Solomon Rajkumar on 12/04/17.
//  Copyright © 2017 Solomon Rajkumar. All rights reserved.
//

import UIKit

class RainyShineViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var temperatureLabel: UILabel!
    
    @IBOutlet weak var weatherIcon: UIImageView!
    
    @IBOutlet weak var currentLocationLabel: UILabel!
    
    @IBOutlet weak var currentWeatherLabel: UILabel!
    
    @IBOutlet weak var weatherForecastTableView: UITableView!
    
    let currentWeather = CurrentWeather()
    let forecastData = ForecastData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        weatherForecastTableView.dataSource = self
        weatherForecastTableView.delegate = self
        
        //print(WEATHER_URL)
        currentWeather.downloadWeatherData {
            
            // parse response
            self.updateUI()
            
        }
        
        forecastData.downloadWeatherForecastData {
            // set table view cells
            self.weatherForecastTableView.reloadData()
            
        }
        
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //print(forecastData.weatherForecasts.count)
        return forecastData.weatherForecasts.count
        //return 10
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "weatherForecastCell", for: indexPath) as? WeatherForecastTableViewCell {
            
            cell.maxTemperatureLabel.text = forecastData.weatherForecasts[indexPath.row].maxTemp
            cell.minTemperatureLabel.text = forecastData.weatherForecasts[indexPath.row].minTemp
            cell.weatherTypeLabel.text = forecastData.weatherForecasts[indexPath.row].weatherType
            cell.weatherForecastImage.image = UIImage(named: forecastData.weatherForecasts[indexPath.row].weatherType)
            cell.dayOfTheWeekLabel.text = forecastData.weatherForecasts[indexPath.row].dayOfTheWeek
            return cell
        }
        
        return WeatherForecastTableViewCell()
        
    }
    
    func updateUI() {
        dateLabel.text = currentWeather.date
        currentLocationLabel.text = currentWeather.cityName
        currentWeatherLabel.text = currentWeather.weatherType
        dateLabel.text = currentWeather.date
        weatherIcon.image = UIImage(named: "\(currentWeather.weatherType)")
        temperatureLabel.text = "\(currentWeather.currentTemperature)"
    }

    

}

