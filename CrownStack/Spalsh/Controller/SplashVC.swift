//
//  SplashVC.swift
//  CrownStack
//
//  Created by Vipul Kumar on 24/07/21.
//

import UIKit

class SplashVC: UIViewController, Storyboarded {
    weak var coordinator: MainCoordinator?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(splashTimeOut), userInfo: nil, repeats: false)
    }
    
    @objc func splashTimeOut() {
        //Setup home home screen
        coordinator?.songsList()
        print_debug(object: "Splash time out")
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
