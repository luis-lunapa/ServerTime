//
//  WebServices.swift
//  ServerTime
//
//  Created by Luis Luna on 1/26/19.
//  Copyright © 2019 DeepTech. All rights reserved.
//

import Foundation
import PromiseKit
import Alamofire


final class WebServices {
    
   // public let shared = WebServices()
    
    private init () {}
    
    static let url = "https://luislunapa.com/universidad/"
    
    /**
     Obtiene de servicio web la hora separada por 3 componentes (Horas, Minutos, Segundos)
     - Author:
     Luis Gerardo Luna
     - returns:
     Una tupla de (Hora, Minutos, Segundos)
     - important:
     Esta función corre asíncronamente, al llamarla se debe manejar la promesa
     - version:
     1.0
     
 
 */
    
    static func getTimeServidor() -> Promise<(String,String,String)> {
        
        return Promise<(String,String,String)> {
            seal in
            
            Alamofire.request(WebServices.url + "clock_service.php").responseJSON {
                response in
                
                if let data = response.result.value {
                    let jsonData = JSON(data)
                    print(jsonData)
                    let hour = jsonData["data"]["hour"].stringValue
                    let minute = jsonData["data"]["minute"].stringValue
                    let second = jsonData["data"]["second"].stringValue
                    
                   
                    seal.fulfill((hour, minute, second))
                    
                    
                    
                } else {
                    seal.reject(NSError(domain: "getTimeServidor", code: 0, userInfo: ["msg": "Error al obtener fecha de servidor"]))
                    
                    
                    
                }
                
            }
            
            
        }
        
       
        
    }
    
    
    
    
    
    
    
    
    
    
}
