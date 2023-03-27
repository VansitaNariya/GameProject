//
//  ViewController2.swift
//  GameProject
//
//  Created by R92 on 14/03/23.
//

import UIKit

class ViewController2: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func hardButtonTapped(_ sender: UIButton) {
        let navigate = storyboard?.instantiateViewController(withIdentifier: "ViewController3") as! ViewController3
        navigationController?.pushViewController(navigate, animated: true)
        navigate.frequency = 0.03
        
        
    }
    
    @IBAction func meadiumButton(_ sender: UIButton) {
        let navigate = storyboard?.instantiateViewController(withIdentifier: "ViewController3") as! ViewController3
        navigationController?.pushViewController(navigate, animated: true)
        navigate.frequency = 0.05
    }
    
    @IBAction func EasyButtonTapped(_ sender: UIButton) {
        let navigate = storyboard?.instantiateViewController(withIdentifier: "ViewController3") as! ViewController3
        navigationController?.pushViewController(navigate, animated: true)
        navigate.frequency = 0.07
        
        
         
            
           
            
        
    }
}
