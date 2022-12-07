//
//  ViewController.swift
//  Ballerina
//
//  Created by Carolina Ortega on 16/07/21.
//

import Foundation
import UIKit


class NomeViewController: UIViewController, UNUserNotificationCenterDelegate {
    
    let myView = NomeView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = myView
        myView.backgroundColor = .systemBackground
        navigationController?.navigationBar.isHidden = true
//        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Register", style: .plain, target: self, action: #selector(registerLocal))
//        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Schedule", style: .plain, target: self, action: #selector(scheduleLocal))

        myView.botaoContinuar.addTarget(self, action: #selector(changeViewController), for: .touchUpInside)
       
    }
    
    open override var shouldAutorotate: Bool {
    get {
        return false
    }
    }
    
    @objc func changeViewController(_ sender: UIButton!) {
        UserDefaults.standard.setValue(myView.nome.text, forKey: "nome")
        navigationController?.pushViewController(ExplorarViewController(), animated: true)
        
    
    }
    
  
}
    


