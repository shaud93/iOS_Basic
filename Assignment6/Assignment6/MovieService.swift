//
//  MovieService.swift
//  Assignment6
//
//  Created by D'Ante Watson on 10/26/23.
//

import Foundation
struct MovieService {
    var repo:MovieRepo
    
    //Constructor Dependecy Injection
    init(repo: MovieRepo)
    {
        self.repo = repo
    }
    // if i wanted to use property dependcy injection i would have put it here
    func addMovie(title:String, year:Int, genre:String, minutes:Int)
    {
        repo.movies.append(MovieModel(title: title, Year: year, genre: genre, minutes: minutes))
    }
    
    func findMovie(title:String) throws -> MovieModel
    {
        for x in repo.movies
        {
            if (x.getTitle() == title)
            {
                return x
            }
        }
        throw MovieExceptions.movieDontExist
    }
    
}
