//
//  NetworError.swift
//  CoreDataExample
//
//  Created by D'Ante Watson on 11/23/23.
//

import Foundation
enum NetworkError:Error{
    case urlError
    case serverNotFound
    case dataNotFound
    case parsingError
}

extension NetworkError:LocalizedError {
    var errorDescription: String?{
        switch self{
        case.urlError:
            return NSLocalizedString("API Url is wrong", comment: "url error")
        case.serverNotFound:
            return NSLocalizedString("Server do not exist", comment: "server not found")
        case.parsingError:
            return NSLocalizedString("data could not be parsed", comment: "parsing error")
        case.dataNotFound:
            return NSLocalizedString("couldnt detect data", comment: "data not found")
        }
    }
}
