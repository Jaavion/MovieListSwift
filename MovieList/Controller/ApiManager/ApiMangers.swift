//
//  ApiManger.swift
//  MovieList
//
//  Created by Jaavion Davis on 9/28/21.
//

import UIKit

class ApiManagers {
    var delegate:ApiManagerDelegate?
    
    func getJsonData(url:String) {
        let urlsession = URLSession.shared
        urlsession.dataTask(with: URL.init(string: url)!) { data, response, error in
            if let movieData = data {
                let jsonDecoder = JSONDecoder.init()
                let movieList = try! jsonDecoder.decode(MovieListModel.self, from: movieData)
                self.delegate?.getMoveApi(data: movieList)
            }
        }.resume()
    

    }
}

protocol ApiManagerDelegate {
    func getMoveApi(data:MovieListModel)
}


