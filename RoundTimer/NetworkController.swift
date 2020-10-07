//
//  NetworkController.swift
//  RoundTimer
//
//  Created by Jerry haaser on 9/21/20.
//  Copyright © 2020 Jerry haaser. All rights reserved.
//

import Foundation
import CoreData

class NetworkController {
    
    static let shared = NetworkController()
    private let baseURL = URL(string: "NeedToMakeThis")!
    
    private init() {}
    
    func createCircuit(from circuitModelRepresentation: CircuitModelRepresentation, completion: @ escaping (Result<CircuitModel, Error>) -> Void) {
        guard let circuitData = encode(item: circuitModelRepresentation) else  { return }
        var request = URLRequest.ctCircuitURL(from: baseURL, with: .post)
        request.httpBody = circuitData
        
        perform(request) { result in
            switch result {
            case .failure(let error):
                completion(.failure(error))
            case .success(let data):
                let possibleReturnedCircuit: ReturnedCircuit? = self.decode(data: data)
                guard let returnedCircuit = possibleReturnedCircuit,
                    let returnedName = returnedCircuit.name else {
                        completion(.failure(FetchError.badData))
                        return
                }
                var completeCircuitRepresentation = circuitModelRepresentation
                completeCircuitRepresentation.circuitName = returnedName
                let circuit = CircuitModel(representation: completeCircuitRepresentation)
                completion(.success(circuit))
                        
            }
        }
    }
    
    func fetchCircuit(completion: @escaping (Result<[CircuitModel], FetchError>) -> Void) {
        let request = URLRequest.ctCircuitURL(from: baseURL, with: .get)
        
        perform(request) { result in
            switch result {
            case .failure(let error):
                completion(.failure(.badData))
                print("NetworkController.fetchCircuit:", error)
            case .success(let data):
                let possibleCircuit: [CircuitModelRepresentation]? = self.decode(data: data)
                
                guard let circuitRepresentation = possibleCircuit else {
                    completion(.failure(.badEncode))
                    return
                }
                let circuits = circuitRepresentation.compactMap { CircuitModel(representation: $0)}
                completion(.success(circuits))
                print(circuits.count)
            }
        }
    }
    
    private func encode<T: Codable>(item: T) -> Data? {
        let jsonEncoder = JSONEncoder()
        jsonEncoder.keyEncodingStrategy = .convertToSnakeCase
        do{
            let encoded = try jsonEncoder.encode(item)
            return encoded
        } catch {
            print("Error encoding item form data: \(error)")
            return nil
        }
    }
    
    private func perform(_ request: URLRequest, completion: @escaping (Result<Data, Error>) -> Void) {
        let dataTask = URLSession.shared.dataTask(with: request) { data, response, error in
            
            if let error = error {
                print("NetworkController.fetc Error: \(error)")
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                print("NetworkController.fetch Data is wrong")
                completion(.failure(FetchError.badData))
                return
            }
            completion(.success(data))
        }
        dataTask.resume()
    }
    
    private func decode<T: Codable>(data: Data) -> T? {
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        //possibly update .base64 to .iso8601??
        jsonDecoder.dataDecodingStrategy = .base64
        do {
            let decoded = try jsonDecoder.decode(T.self, from: data)
            return decoded
        } catch {
            print("Error decoding item from data: \(error)")
            print(String(data: data, encoding: .utf8)!)
            return nil
        }
    }
    
}
