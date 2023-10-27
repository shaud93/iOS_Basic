//
//  MovieService3.swift
//  Assignment6
//
//  Created by D'Ante Watson on 10/27/23.
//

import Foundation

struct MovieService3 {
    
    
    //Method Depency Injection
    mutating func addMovie(title:String, year:Int, genre:String, minutes:Int, repo:MovieRepo?)
    {
        if let repo = repo {
            repo.movies.append(MovieModel(title: title, Year: year, genre: genre, minutes: minutes))
        }
            
    }
    
    //Method Depency Injection
    func findMovie(title:String, repo:MovieRepo?) throws -> MovieModel
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
