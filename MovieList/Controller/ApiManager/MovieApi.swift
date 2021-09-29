//
//  MovieApi.swift
//  MovieList
//
//  Created by Jaavion Davis on 9/27/21.
//
import UIKit
import Foundation


class ApiManager {
    static let shared = ApiManager()
    
    func getMovieData(url:String, completionHandler: @escaping ((MovieListModel?)) ->()) {
        let urlSession = URLSession.shared
        urlSession.dataTask(with: URL.init(string: url)!) {data, response, error in
            if let movieData = data {
                let jsonDecoder = JSONDecoder()
                let movieList = try! jsonDecoder.decode(MovieListModel.self, from: movieData)
                completionHandler(movieList)
            }
        }.resume()
    }
}



