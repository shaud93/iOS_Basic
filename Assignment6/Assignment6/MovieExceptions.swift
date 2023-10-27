//
//  MovieExceptions.swift
//  Assignment6
//
//  Created by D'Ante Watson on 10/26/23.
//

import Foundation

enum MovieExceptions:Error {
    case movieExist
    case movieDontExist
}

extension MovieExceptions:LocalizedError {
    var errorDescription: String?
    {
        switch self
        {
        case .movieExist:
            return NSLocalizedString("This movie has already been added", comment: "Execution Denied")
        case .movieDontExist:
            return NSLocalizedString("This movie could not be found", comment: "Not Found")
        }
        
    }
    
}
