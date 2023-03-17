//
//  Model.swift
//  Hospital
//
//  Created by İrem Çaltı on 17.08.2022.
//

import Foundation

struct Model:Codable {
   
    var name: String
    var imageName: String
    var logoName: String
    var title: String
    var text: String
    var weekDayHours: String
    var weekendHours: String
    var closedArea: String
    var bedCount: String
    var address: String
    var phone: String
    var fax: String
    var latitude: Double
    var longitude: Double
    
}
