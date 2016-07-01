//
//  detailsTableViewCell.swift
//  AppleCityGuide
//
//  Created by user on 24.06.16.
//  Copyright © 2016 Roborzoid. All rights reserved.
//

import UIKit
import KFSwiftImageLoader


class detailsTableViewCell: UITableViewCell {

    
    @IBOutlet weak var thumImage: UIImageView!
    
    @IBOutlet weak var tourName: UILabel!
    
    @IBOutlet weak var daysDuration: UILabel!
    
    @IBOutlet weak var tourLength: UILabel!
    
    @IBOutlet weak var tourComplexity: UILabel!
    
    @IBOutlet weak var tourType: UILabel!
    
    

  
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
      /*  thumImage.loadImageFromURLString("https://www.googleapis.com/customsearch/v1&key=AIzaSyCaMO0KMsG-4oFDnIF2GDjtUQsxsPzCRjg&cx=015971991609076514356:gaflkqkbrwo&q=flower&searchType=image&fileType=jpg&imgSize=medium&start=1&num=1", placeholderImage: nil)*/
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
