//
//  ViewController.swift
//  Assignment6
//
//  Created by D'Ante Watson on 10/26/23.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // movies is accessable because it has internal access [can be used in the same module] [default]
        let repo = MovieRepo()
        //repo.movies
        
        //can not access movies because it have file private access [cant be used outside of the repo2 file]
        let repo2 = MovieRepo2()
        //repo2.movies
        
        //constructor depency injection
        let service = MovieService(repo: repo)
        
        //property depency injection
        var service2 = MovieService2() // can not be a const
        service2.repo = repo //[important if forgotten injection will not work]
        
        //method depency injection
        let service3 = MovieService3()
        
        //populating movie database
        service.addMovie(title: "The GodFather", year: 1972, genre: "Crime", minutes: 175)
        service.addMovie(title: "Fight Club", year: 1999, genre: "Action", minutes: 139)
        service.addMovie(title: "The Dark Knight", year: 2008, genre: "Action", minutes: 152)
        service.addMovie(title: "Gladiator", year: 2000, genre: "Action", minutes: 155)
        service.addMovie(title: "American History X", year: 1998, genre: "Drama", minutes: 119)
        service.addMovie(title: "Friday", year: 1995, genre: "Comedy", minutes: 91)
        service.addMovie(title: "Ip Man", year: 2008, genre: "Action", minutes: 106)
        
        // Year is private and can not be call directly [must use getter]
        //print(repo.movies[0].Year)
        print(repo.movies[0].getYear())
        
        //constructor depency injection results
        do {
            var result =  try service.findMovie(title: "Ip Man")
            print("Title: \(result.getTitle()), Year: \(result.getYear()), Genre: \(result.getGenre()), Runtime: \(result.getMinutes())")
        } catch let MovieExceptions{
            print(MovieExceptions.localizedDescription)
        }
        
        //property depency injection results
        do {
            var result =  try service2.findMovie(title: "American History X")
            print("Title: \(result.getTitle()), Year: \(result.getYear()), Genre: \(result.getGenre()), Runtime: \(result.getMinutes())")
        } catch let MovieExceptions{
            print(MovieExceptions.localizedDescription)
        }
        
        //method depency injection results
        do {
            var result =  try service3.findMovie(title: "Friday", repo: repo)
            print("Title: \(result.getTitle()), Year: \(result.getYear()), Genre: \(result.getGenre()), Runtime: \(result.getMinutes())")
        } catch let MovieExceptions{
            print(MovieExceptions.localizedDescription)
        }
    }
    
}
