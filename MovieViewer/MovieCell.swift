//
//  MovieCell.swift
//  MovieViewer
//
//  Created by Dang Quoc Huy on 6/30/16.
//  Copyright © 2016 Dang Quoc Huy. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var posterView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setData(movie: Movie) {
        
        titleLabel.text = movie.title
        overviewLabel.text = movie.overview
        if movie.posterUrl != nil {
            let request = NSURLRequest(URL: movie.posterUrl!)
            posterView.setImageWithURLRequest(request, placeholderImage: nil, success: { (request, response, image) in
                
                // image come frome cache
                if response == nil {
                    self.posterView.image = image
                } else {
                    self.posterView.setImageWithFadeIn(image)
                }
            }, failure: { (request, response, error) in
                
                // process error here
                debugPrint(error.localizedDescription)
            })
        }
    }
}
