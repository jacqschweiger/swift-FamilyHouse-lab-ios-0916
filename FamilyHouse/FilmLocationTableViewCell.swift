//
//  FilmLocationTableViewCell.swift
//  FamilyHouse
//
//  Created by Jacqueline Minneman on 10/10/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class FilmLocationTableViewCell:
    UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!

    @IBOutlet weak var addressLabel: UILabel!
    
    @IBOutlet weak var TVSeriesLabel: UILabel!
    
    var filmLocation: FilmLocation! {
        didSet {
            nameLabel.text = filmLocation.name
            addressLabel.text = filmLocation.address
            TVSeriesLabel.text = filmLocation.tvSeries.description
        }
      
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
