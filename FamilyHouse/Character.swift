//
//  Character.swift
//  FamilyHouse
//
//  Created by Jacqueline Minneman on 10/10/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation
import UIKit

struct Character {
    let name: String
    let realLifename: String
    let tvSeries: TVSeries
    var currentLocation: FilmLocation
    let image: UIImage
   
    func canReportToSet(on location: FilmLocation) -> Bool {
        if self.tvSeries == location.tvSeries {
            return true
        }
        return false
    }

    mutating func reportToSet(on location: FilmLocation) {
        if self.canReportToSet(on: location) {
            self.currentLocation = location
        }
    }

}
