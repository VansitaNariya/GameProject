//
//  ViewController.swift
//  GameProject
//
//  Created by R92 on 14/03/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var nextButtonTapped: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func nextButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController2 = storyboard.instantiateViewController(withIdentifier: "ViewController2")
        navigationController?.pushViewController(viewController2, animated: true)
        
    }
    
    
}

