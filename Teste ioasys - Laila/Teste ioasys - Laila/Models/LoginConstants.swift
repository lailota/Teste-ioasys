//
//  LoginConstants.swift
//  Teste ioasys - Laila
//
//  Created by Laila Guzzon Hussein Lailota on 25/06/21.
//

import Foundation

public let passwordMinLength = 6
public let passwordMaxLength = 16
    
public let signupURLString = "https://empresas.ioasys.com.br/api"
public let apiVersion = "v1"
public let enterpriseAPI = "enterprises"
public let enterpriseEndpoint = "https://empresas.ioasys.com.br/api/v1/enterprises"
public let singinEndpoint = "\(signupURLString)/\(apiVersion)/users/auth/sign_in/"

public var accessToken: String?
public var client: String?
public var uid: String?
public var contentType: String?
