//
//  MoveListModel.swift
//  MovieList
//
//  Created by Jaavion Davis on 9/25/21.
//

import Foundation
/*
{
  "results": [
    {
      "backdrop_path": "/byflnwPMumyvrCW9SfO5Miq3647.jpg",
      "id": 597891,
      "original_title": "Kate",
      "popularity": 1869.405,
      "release_date": "2021-09-10",
      "title": "Kate"
    }
  ]
}
*/
struct Movie:Codable {
    var id:Int
    var original_title:String
    var popularity:Double
    var release_date:String
    var title:String
    var backdrop_path:String
}
struct MovieListModel:Codable {
    var results:[Movie]?;
}
