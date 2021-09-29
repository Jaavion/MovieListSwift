//
//  File.swift
//  MovieList
//
//  Created by Jaavion Davis on 9/29/21.
//
import UIKit
import Foundation
extension UIImageView {
    func imageFromServerURL(_ URLString: String) {
        let image_url = Constant.IMAGE_BASE_URL.rawValue + URLString
        if let url = URL(string: image_url) {
            URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
                DispatchQueue.main.async {
                    if let data = data {
                        if let downloadedImage = UIImage(data: data) {
                            self.image = downloadedImage
                        }
                    }
                }
            }).resume()
        }
    }
}


enum Constant : String {
    case  MOVIE_LIST_URL = "https://api.themoviedb.org/3/discover/movie?api_key=c91ed3a7a344459eccad9687acf0d07e"
    case IMAGE_BASE_URL =
    "https://image.tmdb.org/t/p/w500"
}

