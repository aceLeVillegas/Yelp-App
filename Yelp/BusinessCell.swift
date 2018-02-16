//
//  BusinessCell.swift
//  Yelp
//
//  Created by Sarah Villegas  on 2/14/18.
//  Copyright © 2018 Timothy Lee. All rights reserved.
//

import UIKit

class BusinessCell: UITableViewCell {

    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var starsImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    
    @IBOutlet weak var reviewsLabel: UILabel!
    
    var business: Business!{
        didSet{
            
            itemImageView.setImageWith(business.imageURL!)
            starsImageView.setImageWith(business.ratingImageURL!)
            titleLabel.text = business.name
            distanceLabel.text = business.distance
            addressLabel.text = business.address
            categoryLabel.text = business.categories
            reviewsLabel.text = "\(business.reviewCount!) Reviews"
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        if (itemImageView != nil){
            
            itemImageView.layer.cornerRadius = 5
            itemImageView.clipsToBounds = true
        }        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
