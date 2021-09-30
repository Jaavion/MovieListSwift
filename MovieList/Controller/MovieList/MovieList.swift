//
//  ViewController.swift
//  MovieList
//
//  Created by Jaavion Davis on 9/25/21.
//

import UIKit

class MovieList: UIViewController {
    var filteredTableData = [String]()
    var resultSearchController = UISearchController()
    var isSearching = false;
    var search:MovieListModel?
    @IBOutlet var movieSearchBar:UISearchBar!
    var apiManager = ApiManagers()
    @IBOutlet var tblView: UITableView!
    var objMovieList: MovieListModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.


        apiManager.delegate = self
        
        apiManager.getJsonData(url: Constant.MOVIE_LIST_URL.rawValue)
        tblView.delegate = self
        tblView.dataSource = self
        tblView.register(UINib(nibName: "MovieListCell", bundle: nil), forCellReuseIdentifier: "cell")
        movieSearchBar.delegate = self
          }

    }
    
 



extension MovieList: UITableViewDataSource, UITabBarDelegate, ApiManagerDelegate, UISearchBarDelegate, UISearchResultsUpdating, UITableViewDelegate {
    func updateSearchResults(for searchController: UISearchController) {
    }
    
    func getMoveApi(data: MovieListModel) {
        self.objMovieList = data
        self.search = data
        DispatchQueue.main.async {
            self.tblView.reloadData()
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return search?.results?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblView.dequeueReusableCell(withIdentifier: "cell") as? MovieListCell
        let movie = objMovieList?.results?[indexPath.row]
        let searched = search?.results?[indexPath.row]
        cell?.contentView.backgroundColor = .black

        
        cell?.movieListImage?.imageFromServerURL(searched!.backdrop_path)
        cell?.movieListRating?.text = searched!.release_date;
        cell?.movieListRating?.textColor = .white;
        cell?.movieListTitle?.text = searched!.title;
        cell?.movieListTitle?.textColor = .white;

        cell?.movieListPopularity?.isHidden = true;
        
        return cell ?? UITableViewCell()
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let story = UIStoryboard.init(name: "Main", bundle: nil);
        let searched = search?.results?[indexPath.row]
        if let movieDetail = story.instantiateViewController(identifier: "j") as? MovieDetailsVC {
            movieDetail.setMovieAttributes(rating: searched!.release_date, popularity: "\(searched!.popularity)", title: searched!.title, image: searched!.backdrop_path)
            
            self.navigationController?.pushViewController(movieDetail, animated: true);
        }
        
    
       
    }
           

    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let movieList = objMovieList?.results
        search?.results?.removeAll()
        for i in movieList! {
            if i.title.localizedCaseInsensitiveContains(searchText) {
                isSearching = true

                search?.results?.append(i)

            }
            if searchText == "" {
                search = objMovieList
                
            }
            self.tblView.reloadData()
    }
        
        
    }
}
