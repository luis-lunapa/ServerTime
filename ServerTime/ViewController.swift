//
//  ViewController.swift
//  ServerTime
//
//  Created by Luis Luna on 1/23/19.
//  Copyright © 2019 DeepTech. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var horaServer: UILabel!
    @IBOutlet weak var minutoServer: UILabel!
    @IBOutlet weak var segundoServer: UILabel!
    
    
    @IBOutlet weak var horaLocal: UILabel!
    @IBOutlet weak var minutoLabel: UILabel!
    @IBOutlet weak var segundoLabel: UILabel!
    
    var timer: Timer?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
      
        self.actualizarTiempo()
        
       
        
    }
    
    //MARK: Obtener datos
    
    func actualizarTiempo() {
       
        WebServices.getTimeServidor().get {
            (h, m, s) in
            
            self.horaServer.text = h
            self.minutoServer.text = m
            self.segundoServer.text = s
            
            
        }
        
        let date = Date()
        
        self.horaLocal.text = String(format: "%02d", Calendar.current.component(.hour, from: date))
        self.minutoLabel.text = String(format: "%02d", Calendar.current.component(.minute, from: date))
        self.segundoLabel.text = String(format: "%02d", Calendar.current.component(.second, from: date))
        
        
    }
    
    // MARK: IBActions de botones
    
    @IBAction func actualizarDidPressed(_ sender: Any) {
        self.actualizarTiempo()
    }
    


}

