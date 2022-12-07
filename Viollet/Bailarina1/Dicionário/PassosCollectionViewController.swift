//
//  ModeSelectCollectionViewController.swift
//  Ballerina
//
//  Created by Carolina Ortega on 17/07/21.
//

import Foundation
import UIKit

class PassosCollectionViewController: UIViewController {
    
    let myView = PassosView()
    var listaPassos = [PassosData]()
    var searching = false
    var passosProcurados = [PassosData]()
    let searchController = UISearchController(searchResultsController: nil)
    
    let passo1 = PassosData(tag: 0, image: "arabesque.png", title: "Arabesque", description: "O peso do corpo é sustentado numa perna só, enquanto a outra se encontra esticada para trás geralmente no ar.")
    let passo2 = PassosData(tag: 1, image: "grand battement.png", title: "Developpé", description: "Ato de lançar a perna para cima e estirada no ar, trabalhando a força e resistência.")
    let passo3 = PassosData(tag: 2, image: "echappe.png", title: "Échappé", description: "Salto e afastamento dos pés onde o corpo é sustentado por ambos. Geralmente realizado com sapatilha de ponta.")
    let passo4 = PassosData(tag: 3, image: "fondu.png", title: "Fondu", description: "Flexão da perna de base, enquanto a outra recolhe ao mesmo tempo. É como se fosse um pilé mas em uma perna.")
    let passo5 = PassosData(tag: 4, image: "jete.png", title: "Grand Jeté", description: "Movimento de atirar a perna, sempre esticada, e com os pés fora do chão, num salto, dando a sensação de que ele está flutuando no ar.")
    let passo6 = PassosData(tag: 5, image: "plie-1.png", title: "Plié", description: "Uma das principais posições que consiste numa flexão de joelhos, que serve para tornar os músculos mais flexíveis e os tendões mais elásticos.")
    let passo7 = PassosData(tag: 6, image: "plie-2.png",title: "Plié na 2ª posição", description: "Variação do plié com braços e pés na segunda posição.")
    let passo8 = PassosData(tag: 7, image: "plie-3.png",title: "Plié na 3ª posição", description: "Variação do plié com braços e pés na terceira posição.")
    let passo9 = PassosData(tag: 8, image: "plie-4.png",title: "Plié na 4ª posição", description: "Variação do plié com braços e pés na quarta posição.")
    let passo10 = PassosData(tag: 9, image: "plie-5.png",title: "Plié na 5ª posição", description: "Variação do plié com braços e pés na quinta posição.")
    let passo11 = PassosData(tag: 10, image: "primeira.png",title: "Primeira posição", description: "Pés en dehors, os calcanhares se encontram e a cava do pé para cima. Os braços ficam abaixo à altura do tronco à frente, arredondados.")
    let passo12 = PassosData(tag: 11, image: "quarta.png",title: "Quarta posição", description: "Pés iguais a terceira, porém mais afastados, um mais à frente do outro. Braços arredondados, o da frente para baixo e o de trás para cima.")
    let passo13 = PassosData(tag: 12, image: "quinta.png",title: "Quinta posição", description: "Pés o mais aberto possível. A ponta do pé de base está atrás do calcanhar do pé da frente. Braços arredondados, mantendo-se sempre à frente da cabeça.")
    let passo14 = PassosData(tag: 13, image: "releve.png",title: "Relevé", description: "Um movimento em que os calcanhares são levantadas do chão em subida, iniciando com plié.")
    let passo15 = PassosData(tag: 14, image: "passe.png",title: "Retiré", description: "Um dos pés permanece de apoio enquanto o outro é levantado em ponta à frente, atrás, ou ao lado do joelho de apoio.")
    let passo16 = PassosData(tag: 15, image: "segunda.png",title: "Segunda posição", description: "Pés mais distantes e en dehors, calcanhares afastados um do outro e a cava do pé para cima. Os braços arredondados, só que abertos para os lados.")
    let passo17 = PassosData(tag: 16, image: "terceira.png",title: "Terceira posição", description: "Calcanhar de base colado atrás do calcanhar à frente. O braço de trás deve estar à frente do tronco, e o braço da frente fica como o braço da segunda posição.")
    let passo18 = PassosData(tag: 17, image: "tendu-devant.png", title: "Tendu Devant", description: "Uma batida esticada, porque ambas as pernas estão esticadas durante a execução e o pé de trabalho não sai do chão.")
    let passo19 = PassosData(tag: 18, image: "tendu-derriere.png", title: "Tendu Derriére", description: "Posição idêntica ao Tendu Devant, com ambas as pernas esticadas, porém com o pé de trabalho atrás.")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = myView
        myView.backgroundColor = .systemBackground
        
        //Adicionando os passos na collectionView
        listaPassos.append(passo1)
        listaPassos.append(passo2)
        listaPassos.append(passo3)
        listaPassos.append(passo4)
        listaPassos.append(passo5)
        listaPassos.append(passo6)
        listaPassos.append(passo7)
        listaPassos.append(passo8)
        listaPassos.append(passo9)
        listaPassos.append(passo10)
        listaPassos.append(passo11)
        listaPassos.append(passo12)
        listaPassos.append(passo13)
        listaPassos.append(passo14)
        listaPassos.append(passo15)
        listaPassos.append(passo16)
        listaPassos.append(passo17)
        listaPassos.append(passo18)
        listaPassos.append(passo19)
        
        
        myView.collectionView.delegate = self
        myView.collectionView.dataSource = self
        
        //Botao voltar
        
        let backButton = UIBarButtonItem()
        backButton.title = "Estudo"
        backButton.tintColor = #colorLiteral(red: 0.5882352941, green: 0.4862745098, blue: 0.6666666667, alpha: 1)
        backButton.action = #selector(changeViewController)
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        
        configureSearchController()
        updateSearchResults(for: searchController)
        scrollViewWillBeginDecelerating(myView.collectionView)
        
        
        
        
    }
    func scrollViewWillBeginDecelerating(_ scrollView: UIScrollView) {
        if scrollView.panGestureRecognizer.translation(in: scrollView).y > 0 {
            navigationController?.navigationBar.prefersLargeTitles = true
            
            
        } else {
            navigationController?.navigationBar.prefersLargeTitles = false
        }
    }
    //Config SearchController
    
    private func configureSearchController(){
        searchController.loadViewIfNeeded()
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        searchController.obscuresBackgroundDuringPresentation = true
        searchController.searchBar.enablesReturnKeyAutomatically = false
        searchController.searchBar.returnKeyType = UIReturnKeyType.done
        searchController.searchBar.placeholder = "Qual passo você procura?"
        self.navigationItem.searchController = searchController
        self.navigationItem.hidesSearchBarWhenScrolling = false
        self.navigationItem.title = "Dicionário"
        
        UIBarButtonItem.appearance(whenContainedInInstancesOf:[UISearchBar.self]).tintColor = #colorLiteral(red: 0.5882352941, green: 0.4862745098, blue: 0.6666666667, alpha: 1)
    }
    
    @objc func changeViewController(){
        navigationController?.pushViewController(BotoesViewController(), animated: true)
        
    }
    @objc func popViewController() {
        navigationController?.popViewController(animated: true)
    }
}



extension PassosCollectionViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource, UISearchResultsUpdating, UISearchBarDelegate {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 336, height: 155)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if searching {
            return passosProcurados.count
        } else {
            return listaPassos.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! PassosCell
        if searching {
            cell.fotoPasso.image = UIImage(named: listaPassos[indexPath.row].image)
            cell.tituloPasso.text = passosProcurados[indexPath.row].title
            cell.descricaoPasso.text = passosProcurados[indexPath.row].description
            
            
        } else {
            cell.fotoPasso.image = UIImage(named: listaPassos[indexPath.row].image)
            cell.tituloPasso.text = listaPassos[indexPath.row].title
            cell.descricaoPasso.text = listaPassos[indexPath.row].description
            
        }
        return cell
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        let searchText = searchController.searchBar.text!
        if !searchText.isEmpty {
            searching = true
            passosProcurados.removeAll()
            for passo in listaPassos {
                if passo.title.lowercased().contains(searchText.lowercased()) {
                    passosProcurados.append(passo)
                    
                }
            }
        }
        else {
            searching = false
            passosProcurados.removeAll()
            passosProcurados = listaPassos
            
        }
        myView.collectionView.reloadData()
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searching = false
        passosProcurados.removeAll()
        myView.collectionView.reloadData()
        
    }
}
