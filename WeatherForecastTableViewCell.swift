//
//  WeatherForecastTableViewCell.swift
//  RainyShine
//
//  Created by Solomon Rajkumar on 19/04/17.
//  Copyright © 2017 Solomon Rajkumar. All rights reserved.
//

import UIKit

class WeatherForecastTableViewCell: UITableViewCell {
    
    @IBOutlet weak var weatherForecastImage: UIImageView!

    @IBOutlet weak var dayOfTheWeekLabel: UILabel!
    
    @IBOutlet weak var maxTemperatureLabel: UILabel!
    
    @IBOutlet weak var weatherTypeLabel: UILabel!
    
    @IBOutlet weak var minTemperatureLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
