//
//  Constants.swift
//  RoundTimer
//
//  Created by Jerry haaser on 10/7/20.
//  Copyright © 2020 Jerry haaser. All rights reserved.
//

import Foundation

enum FetchError: String, Error {
    case badData = "There was a data error. Please try again"
    case badResponse = "There was a bad response. Please try again."
    case badEncode = "There was a problem encoding. Please try again"
    case otherError = "Something went wrong. Please try again"
    case noUser = "Please log in."
}

enum HTTPMethod: String {
    case get = "GET"
    case put = "PUT"
    case post = "POST"
    case delete = "DELETE"
}

enum UserAction: String {
    case login = "login"
    case register = "register"
}
