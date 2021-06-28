//
//  Enterprise.swift
//  Teste ioasys - Laila
//
//  Created by Laila Guzzon Hussein Lailota on 25/06/21.
//

import Foundation
import UIKit

struct Enterprise{

    let id: Int
    let enterpriseName: String
    let enterpriseDescription: String
    let enterpriseType: EnterpriseType
    
    let cellColor: UIColor
    
    init(id: Int, enterpriseName: String, enterpriseDescription: String, enterpriseType: EnterpriseType, cellColor: UIColor) {

    self.id = id
    self.enterpriseName = enterpriseName
    self.enterpriseDescription = enterpriseDescription
    self.enterpriseType = enterpriseType
    self.cellColor = cellColor
    }
}

struct EnterpriseType : Encodable {
    let id: Int
    let enterpriseTypeName: String
    
    init(id: Int, enterpriseTypeName: String) {
        self.id = id
        self.enterpriseTypeName = enterpriseTypeName
    }
}
