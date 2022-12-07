//
//  ExplorarCollectionViewController.swift
//  Ballerina
//
//  Created by Carolina Ortega on 18/07/21.
//

import Foundation
import UIKit

class ExplorarViewController: UIViewController {
    
    let defaults = UserDefaults.standard
    let myView = ExplorarView()
    let viewBotoes = BotoesView()
    
    open override var shouldAutorotate: Bool {
    get {
        return false
    }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = myView
        myView.backgroundColor = .systemBackground
//        myView.backgroundColor = #colorLiteral(red: 0.9764705882, green: 0.9764705882, blue: 0.9764705882, alpha: 1)
        myView.collectionView.delegate = self
        myView.collectionView.dataSource = self
        myView.botaoProgresso.addTarget(self, action: #selector(changeViewController), for: .touchUpInside)
        myView.botaoReflexao.addTarget(self, action: #selector(changeViewController), for: .touchUpInside)
        myView.botaoAjuda.addTarget(self, action: #selector(changeViewController), for: .touchUpInside)
    

        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    @objc func popViewController() {
        navigationController?.popViewController(animated: true)

    }
    

    @objc func changeViewController(_ sender: UIButton!) {
        switch sender {
            case myView.botaoReflexao:
                navigationController?.pushViewController(PerguntasPageViewController(), animated: true)
                
            case myView.botaoProgresso:
                navigationController?.pushViewController(ProgressoViewController(), animated: true)
            case myView.botaoAjuda:
                navigationController?.pushViewController(AjudaPageViewController(), animated: true)
            default:
                self.defaults.set(sender.tag, forKey: "botao")
                navigationController?.pushViewController(BotoesViewController(), animated: true)
        }
    }
    }

extension ExplorarViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 150)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ExplorarCell
        cell.explorarData = myView.explorarData[indexPath.row]
        cell.botoes.addTarget(self, action: #selector(changeViewController), for: .touchUpInside)
        return cell
    }
}


