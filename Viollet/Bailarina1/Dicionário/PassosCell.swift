//
//  PasssoCell.swift
//  Ballerina
//
//  Created by Carolina Ortega on 17/07/21.
//


import Foundation
import UIKit


class PassosCell: UICollectionViewCell {
    let passos = UIView()
    let tituloPasso = UILabel()
    let descricaoPasso = UILabel()
    let fotoPasso = UIImageView()
    var passosData: PassosData? {
        didSet {
            guard let passosData = passosData else { return }
            passos.tag = passosData.tag
            tituloPasso.text = passosData.title
            descricaoPasso.text = passosData.description
            
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        contentView.addSubview(passos)
        contentView.addSubview(tituloPasso)
        contentView.addSubview(descricaoPasso)
        contentView.addSubview(fotoPasso)
        
  
        //Config Título
        
        tituloPasso.textColor = .black
        tituloPasso.self.font = UIFont.systemFont(ofSize: 25.0, weight: .regular)
       
        tituloPasso.translatesAutoresizingMaskIntoConstraints = false
        let tituloPassoConstraints: [NSLayoutConstraint] = [
            tituloPasso.topAnchor.constraint(equalTo: passos.topAnchor, constant: -95),
            tituloPasso.bottomAnchor.constraint(equalTo: passos.bottomAnchor, constant: 10),
            tituloPasso.leadingAnchor.constraint(equalTo: passos.leadingAnchor, constant: 20),
            tituloPasso.trailingAnchor.constraint(equalTo: passos.trailingAnchor, constant: -20)
        ]
        NSLayoutConstraint.activate(tituloPassoConstraints)
        
        //Config Descrição
        
        descricaoPasso.textColor = .black
        descricaoPasso.self.font = UIFont.systemFont(ofSize: 12.0, weight: .light)
        descricaoPasso.numberOfLines = 0
//        descricaoPasso.backgroundColor = .red
        
        descricaoPasso.translatesAutoresizingMaskIntoConstraints = false
        let descricaoPassoConstraints: [NSLayoutConstraint] = [
            descricaoPasso.topAnchor.constraint(equalTo: tituloPasso.bottomAnchor, constant: -106),
            descricaoPasso.bottomAnchor.constraint(equalTo: passos.bottomAnchor, constant: -10),
            descricaoPasso.leadingAnchor.constraint(equalTo: tituloPasso.leadingAnchor),
            descricaoPasso.trailingAnchor.constraint(equalTo: passos.centerXAnchor, constant: 28)
        ]
        NSLayoutConstraint.activate(descricaoPassoConstraints)
        
        //Config passos
        
        passos.backgroundColor = #colorLiteral(red: 0.9008278251, green: 0.8397245407, blue: 0.9364857078, alpha: 1)
        passos.contentMode = .scaleAspectFill
        passos.clipsToBounds = true
        passos.layer.cornerRadius = 10
        passos.translatesAutoresizingMaskIntoConstraints = false
        let backgroundConstraints: [NSLayoutConstraint] = [
            passos.topAnchor.constraint(equalTo: contentView.topAnchor),
            passos.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            passos.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            passos.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ]
        NSLayoutConstraint.activate(backgroundConstraints)
      
        //Config foto
        
//        fotoPasso.backgroundColor = .blue
        fotoPasso.translatesAutoresizingMaskIntoConstraints = false
        let fotoPassoConstraints: [NSLayoutConstraint] = [
            fotoPasso.topAnchor.constraint(equalTo: passos.topAnchor, constant: 5),
            fotoPasso.bottomAnchor.constraint(equalTo: passos.bottomAnchor, constant: -5),
            fotoPasso.leadingAnchor.constraint(equalTo: passos.leadingAnchor, constant: 200),
            fotoPasso.trailingAnchor.constraint(equalTo: passos.trailingAnchor, constant: -5)
        ]
        NSLayoutConstraint.activate(fotoPassoConstraints)
    
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


