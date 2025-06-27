//
//  ServiceManager.swift
//  ThreadQAUITests
//
//  Created by Yehor Yehorychev on 6/27/25.
//

import Foundation
import XCTest

struct ServiceManager {
    
    func getUsers(pageNumber: Int) -> URL {
        return URL(string: "https://reqres.in/api/users?page=\(pageNumber)")!
    }
}

extension ServiceManager {
    
    func getRequest<T:Decodable>(resource: URL, decodeType: T.Type) -> T {
        var request = URLRequest(url: resource)
        request.httpMethod = "GET"
        
        var decodedData: T? = nil
        let semaphor = DispatchSemaphore(value: 0)
        
        let session = URLSession.shared
        session.dataTask(with: request) {
            (data, response, err) in
            decodedData = try! JSONDecoder().decode(T.self, from: data!)
            semaphor.signal()
        }.resume()
        semaphor.wait()
        return decodedData!
    }
}
