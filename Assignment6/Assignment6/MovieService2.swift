//
//  MovieService2.swift
//  Assignment6
//
//  Created by D'Ante Watson on 10/27/23.
//

import Foundation

struct MovieService2 {
    
    //Property depency injection
    var repo:MovieRepo?
    
    
    mutating func addMovie(title:String, year:Int, genre:String, minutes:Int)
    {
        if let repo = repo {
            repo.movies.append(MovieModel(title: title, Year: year, genre: genre, minutes: minutes))
        }
            
    }
    
    func findMovie(title:String) throws -> MovieModel
    {
        if let repo = repo
        {
            
            for x in repo.movies
                    {
                        if (x.getTitle() == title)
                        {
                            return x
                        }
                    }
                }
        throw MovieExceptions.movieDontExist
        }
        
    
}
