//
//  MovieDetailsVC.swift
//  MovieList
//
//  Created by Jaavion Davis on 9/30/21.
//

import UIKit

class MovieDetailsVC: UIViewController {
    var movieTitle:String?
    var movieRating:String?
    var moviePopularity:String?
    var movieImage:String?
    
    @IBOutlet var lblMovieTitle:UILabel!
    @IBOutlet var lblMovieRating:UILabel!
    @IBOutlet var lblMoviePopularity:UILabel!
    @IBOutlet var lblMovieImage:UIImageView!


    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblMovieTitle.text = movieTitle
        lblMovieRating.text = movieRating
        lblMoviePopularity.text = moviePopularity
        lblMovieImage?.imageFromServerURL(movieImage!)

    }
    

    func setMovieAttributes(rating:String, popularity:String, title:String, image:String) {
       movieTitle =  title;
        movieRating = rating;
        moviePopularity = popularity
        movieImage = image
    }
   
    
}
