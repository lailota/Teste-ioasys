//
//  LoginApiModel.swift
//  Teste ioasys - Laila
//
//  Created by Laila Guzzon Hussein Lailota on 25/06/21.
//

import Foundation
import UIKit

class LoginApiModel {
    
    public static let api = LoginApiModel()
    public var enterpriseJson: String? = nil
    public var httpResponse: HTTPURLResponse?
   
    init() {
    }
    
    func authenticate(email: String, password: String) {
        let parameters = "{\n    \"email\": \"\(email)\",\n    \"password\": \"\(password)\"\n}"
        let httpBody = parameters.data(using: .utf8)
        var request = URLRequest(url: URL(string: singinEndpoint)!,timeoutInterval: Double.infinity)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("text/plain", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        
        request.httpBody = httpBody
        let task = URLSession.shared
        task.dataTask(with: request) { (data, response, error) in
            guard let data = data else {
                print("Error \(String(describing: error))")
                return
            }
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String : Any]
                
                self.enterpriseJson = json?["enterprise"] as? String
                self.httpResponse = response as? HTTPURLResponse
                contentType = self.httpResponse?.allHeaderFields["Content-Type"] as? String
                accessToken = self.httpResponse?.allHeaderFields["access-token"] as? String
                client = self.httpResponse?.allHeaderFields["client"] as? String
                uid = self.httpResponse?.allHeaderFields["uid"] as? String
                
            } catch {
                print("\(error)")
            }
            
        }
        .resume()
    
    }
    
}


