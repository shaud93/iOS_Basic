import UIKit

// varibles [type infernce]
var movie = "Matrix"
let year = 1993
var ratings = 8.7
var streamable = true

// varibles
var movie2:String = "Get Rich Or Die Trying"
let year2:Int = 2005
var ratings2:Float = 8.8
var streamable2:Bool = true

// Tuple
var show = ("Dave Chapple Show","Comedy", 2003)
let show2 = ("Sparticus", "Action Fiction", 2010)

// Array
var sports = ["FootBall", "BasketBall", "Soccer", "MMA"]
print(sports)

// Adding To An Array
sports.append("Swimming")
print(sports)

// Collection [Any]
var UFC:[Any] = ["Israel Adesanya", 24, 3, false]
print(UFC)


// printing
print("Hello")


// function
func matrix()
{
    print("Hello Mr Anderson")
}

matrix()


func getRichOrDieTrying()
{
    print("Many man")
}

getRichOrDieTrying()


//fuctions [params]
func favoriteMovie(movie:String)
{
    print("My favorite Movie is" + " " + movie)
}

favoriteMovie(movie: "The Fifth Element")


// returning function
func Favorite_TV_Show(show:String) -> String 
{
    return "My favorite TV Show is " + show
}

Favorite_TV_Show(show: "The Office")

// function [Tuple] [return]
func My_Favorite_Manga(title:String, Chapters:Int, HaveAnime:Bool) -> (String,Int,Bool)
{
    let Tuple = (title, Chapters, HaveAnime)
    
    print("My favorite manga is " + Tuple.0 + " " + "it has " + String(Tuple.1) + " " + "Chapters" + " Have Anime:" + String(Tuple.2))
    
    return Tuple
}

print(My_Favorite_Manga(title: "Beserk", Chapters: 364, HaveAnime: true))






