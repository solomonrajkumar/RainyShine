//
//  Constants.swift
//  RainyShine
//
//  Created by Solomon Rajkumar on 13/04/17.
//  Copyright © 2017 Solomon Rajkumar. All rights reserved.
//

import Foundation


let BASE_URL = "http://api.openweathermap.org/data/2.5/weather?"
let LATITUDE = "lat="
let AMPERSAND_SYMBOL = "&"
let LONGITUDE = "lon="
let APP_ID = "appid="
let API_KEY = "356d2f7f6bf11446a6e19807346ba0c1"

let WEATHER_URL = "\(BASE_URL)\(LATITUDE)12.991731\(AMPERSAND_SYMBOL)\(LONGITUDE)77.668914\(AMPERSAND_SYMBOL)\(APP_ID)\(API_KEY)"

typealias DownloadComplete = () -> ()
