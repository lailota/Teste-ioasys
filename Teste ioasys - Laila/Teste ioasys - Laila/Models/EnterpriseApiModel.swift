//
//  EnterpriseApiModel.swift
//  Teste ioasys - Laila
//
//  Created by Laila Guzzon Hussein Lailota on 27/06/21.
//

import Foundation
import UIKit

class EnterpriseApiModel {
    
    public static let enterprise = EnterpriseApiModel()
    
    public var enterprises: [Enterprise] = []
    public var filteredEnterprises: [Enterprise] = []
    
    var api = LoginApiModel()
    
    private init() {
        getEntreprise()
    }
    
    func getEntreprise() {
        var request = URLRequest(url: URL(string: enterpriseEndpoint)!, timeoutInterval: Double.infinity)
        request.addValue(contentType ?? "", forHTTPHeaderField: "Content-Type")
        request.addValue(accessToken ?? "", forHTTPHeaderField: "access-token")
        request.addValue(client ?? "", forHTTPHeaderField: "client")
        request.addValue(uid ?? "", forHTTPHeaderField: "uid")
        request.httpMethod = "GET"
        
        let sesseion = URLSession.shared
        sesseion.dataTask(with: request) { (data, response, error) in
            guard let _data = data else {
                print(String(describing: error))
                return
            }
            do {
                let json = try JSONSerialization.jsonObject(with: _data, options: .mutableContainers) as? [String : Any]
                guard let enterprise: Array<[String : Any]> = json?["enterprises"] as? Array<[String : Any]> else {
                    print("estou vazio!!!!!!!!!!!!")
                    return
                }
                
                var color: Int = 0
                for StoredEnterprises in enterprise {
                    guard let enterpriseType: [String : Any] = StoredEnterprises["enterprise_type"] as? [String : Any] else {
                        return
                    }
                    var colorCell: UIColor = .white
                    switch color {
                    case 0:
                        colorCell = #colorLiteral(red: 0.4745098039, green: 0.7333333333, blue: 0.7921568627, alpha: 1)
                        color = 1
                    case 1:
                        colorCell = #colorLiteral(red: 0.9215686275, green: 0.5921568627, blue: 0.5921568627, alpha: 1)
                        color = 2
                    case 2:
                        colorCell = #colorLiteral(red: 0.5647058824, green: 0.7333333333, blue: 0.5058823529, alpha: 1)
                        color = 0
                    default:
                        break
                    }
                    let objectEnterprise: Enterprise = Enterprise(id: StoredEnterprises["id"] as! Int,
                                                                  enterpriseName: StoredEnterprises["enterprise_name"] as! String,
                                                                  enterpriseDescription: StoredEnterprises["description"] as! String,
                                                                  enterpriseType: EnterpriseType(id: enterpriseType["id"] as! Int,
                                                                                                 enterpriseTypeName: enterpriseType["enterprise_type_name"] as! String),
                                                                  cellColor: colorCell)
                    self.enterprises.append(objectEnterprise)
                }
                
            } catch {}
        }.resume()
    }
    
    
    
    
    
    
    
}
