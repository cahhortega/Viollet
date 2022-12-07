//
//  ExplorarCell.swift
//  Ballerina
//
//  Created by Carolina Ortega on 18/07/21.
//

import Foundation
import UIKit


class ExplorarCell: UICollectionViewCell {
    
    let botoes = UIButton(type: .system)
    let tituloBotao = UILabel()
    let fotoBotao = UIImageView()
    var explorarData: ExplorarData? {
        didSet {
            guard let explorarData = explorarData else { return }
            botoes.tag = explorarData.tag
            tituloBotao.text = explorarData.title
            fotoBotao.image = explorarData.image
            
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        contentView.addSubview(botoes)
        contentView.addSubview(tituloBotao)
        contentView.addSubview(fotoBotao)
       
        //Config Botoes
        botoes.backgroundColor = #colorLiteral(red: 0.9008278251, green: 0.8397245407, blue: 0.9364857078, alpha: 1)
        botoes.contentMode = .scaleAspectFill
        botoes.clipsToBounds = true
        botoes.layer.cornerRadius = 15
        
        botoes.translatesAutoresizingMaskIntoConstraints = false
        let botoesConstraints: [NSLayoutConstraint] = [
            botoes.topAnchor.constraint(equalTo: contentView.topAnchor),
            botoes.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            botoes.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            botoes.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            botoes.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5)
        ]
        NSLayoutConstraint.activate(botoesConstraints)
        
        
        //Config titulo
        
        tituloBotao.textColor = .black
        tituloBotao.font = UIFont.systemFont(ofSize: 20.0, weight: .regular)
        tituloBotao.textAlignment = .center
        
        tituloBotao.translatesAutoresizingMaskIntoConstraints = false
        let tituloPassoConstraints: [NSLayoutConstraint] = [
            tituloBotao.topAnchor.constraint(equalTo: botoes.topAnchor),
            tituloBotao.bottomAnchor.constraint(equalTo: botoes.bottomAnchor, constant: -100),
            tituloBotao.leadingAnchor.constraint(equalTo: botoes.leadingAnchor),
            tituloBotao.trailingAnchor.constraint(equalTo: botoes.trailingAnchor)
        ]
        NSLayoutConstraint.activate(tituloPassoConstraints)
        
        //Config foto
              
        fotoBotao.translatesAutoresizingMaskIntoConstraints = false
        let fotoPassoConstraints: [NSLayoutConstraint] = [
            fotoBotao.topAnchor.constraint(equalTo: botoes.topAnchor, constant: 40),
            fotoBotao.bottomAnchor.constraint(equalTo: botoes.bottomAnchor),
            fotoBotao.leadingAnchor.constraint(equalTo: botoes.leadingAnchor, constant: 15),
            fotoBotao.trailingAnchor.constraint(equalTo: botoes.trailingAnchor, constant: -15)
        ]
        NSLayoutConstraint.activate(fotoPassoConstraints)
    
    }
 
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


