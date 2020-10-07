//
//  URL+Extension.swift
//  RoundTimer
//
//  Created by Jerry haaser on 10/7/20.
//  Copyright © 2020 Jerry haaser. All rights reserved.
//

import Foundation

extension URLRequest {
    static func ctCircuitURL(from url: URL, with method: HTTPMethod) -> URLRequest {
        let endpoint = url.appendingPathComponent("tbd")
        var request = URLRequest(url: endpoint)
        request.httpMethod = method.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content=Type")
        return request
    }
    
    //TODO: ctUserURL
}
