//
//  MovieListCell.swift
//  MovieList
//
//  Created by Jaavion Davis on 9/25/21.
//

import UIKit

class MovieListCell: UITableViewCell {
    @IBOutlet var movieListImage:UIImageView?
    @IBOutlet var movieListRating:UILabel?
    @IBOutlet var movieListPopularity:UILabel?
    @IBOutlet var movieListTitle:UILabel?

    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    

}

//extension MovieListCell: UISearchResultsUpdating {
//    func updateSearchResults(for searchController: UISearchController) {
//        <#code#>
//    }
//    
//    
//}
