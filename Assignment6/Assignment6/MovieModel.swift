//
//  Movie.swift
//  Assignment6
//
//  Created by D'Ante Watson on 10/26/23.
//

import Foundation

//internal: everything in the same module
class MovieModel {
    
    //private: only accessible in the defined class or struct
    private var title:String
    private var Year:Int
    private var genre:String
    private var minutes:Int
    
    init(title: String, Year: Int, genre: String, minutes: Int) {
        self.title = title
        self.Year = Year
        self.genre = genre
        self.minutes = minutes
    }
    
    //GETTERS
    func getTitle() -> String{
        return self.title
    }
    
    func getYear() -> Int{
        return self.Year
    }
    
    func getGenre() -> String{
        return self.genre
    }
    
    func getMinutes() -> Int{
        return self.minutes
    }
    
    //SETTERS
    func setTitle(title:String){
        self.title = title
    }
    
    func setYear(year:Int){
        self.Year = year
    }
    
    func setGenre(genre:String){
        self.genre = genre
    }
    
    func setMinutes(minutes:Int){
        self.minutes = minutes
    }
}
