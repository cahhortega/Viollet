//
//  BotoesExplorarView.swift
//  Ballerina 2.1
//
//  Created by Carolina Ortega on 20/07/21.
//


import Foundation
import UIKit



class BotoesView: UIView {
    let tituloBotao = UILabel()
    let descricaoBotao = UILabel()
    let fotoBotao = UIImageView()
    let botaoDicionario = UIButton()
    let tabela = UITableView()

    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        backgroundColor = .white
        addSubview(descricaoBotao)
        addSubview(tituloBotao)
        addSubview(fotoBotao)
        addSubview(botaoDicionario)
        addSubview(tabela)
        fotoBotao.contentMode = .scaleAspectFill

        
        botaoDicionario.translatesAutoresizingMaskIntoConstraints = false
        botaoDicionario.setTitle("Acessar Dicionário", for: .normal)
        botaoDicionario.setTitleColor(.black, for: .normal)
        botaoDicionario.backgroundColor = #colorLiteral(red: 0.6754398942, green: 0.8616247773, blue: 0.849842608, alpha: 1)
        botaoDicionario.titleLabel?.font = .systemFont(ofSize: 15, weight: .medium)
        botaoDicionario.layer.cornerRadius = 10
        botaoDicionario.isHidden = true
        botaoDicionario.isEnabled = false
        
        let botaoDicionarioConstraints: [NSLayoutConstraint] = [
            botaoDicionario.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 100),
            botaoDicionario.centerXAnchor.constraint(equalTo: centerXAnchor),
            botaoDicionario.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -100),
            botaoDicionario.topAnchor.constraint(equalTo: tabela.bottomAnchor, constant: 28),
            botaoDicionario.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -80),
            
        ]
        NSLayoutConstraint.activate(botaoDicionarioConstraints)
        
        //Config Titulo
//        tituloBotao.self.textColor = #colorLiteral(red: 0.5882352941, green: 0.4862745098, blue: 0.6666666667, alpha: 1)
        tituloBotao.self.font = UIFont.systemFont(ofSize: 34.0, weight: .medium)
        tituloBotao.self.textAlignment = .left
//        tituloBotao.backgroundColor = .red
        tituloBotao.translatesAutoresizingMaskIntoConstraints = false
        
        let passosLabelConstraints: [NSLayoutConstraint] = [
            tituloBotao.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            tituloBotao.trailingAnchor.constraint(equalTo: centerXAnchor, constant: 50),
            tituloBotao.topAnchor.constraint(equalTo: topAnchor, constant: 190),
//            tituloBotao.bottomAnchor.constraint(equalTo: centerYAnchor, constant: -250)
        ]
        NSLayoutConstraint.activate(passosLabelConstraints)
    
        //Config Foto
//        fotoPasso.backgroundColor = .yellow
        fotoBotao.contentMode = .scaleAspectFit
        fotoBotao.clipsToBounds = true
        fotoBotao.translatesAutoresizingMaskIntoConstraints = false
        let fotoPassoConstraints: [NSLayoutConstraint] = [
            fotoBotao.topAnchor.constraint(equalTo: topAnchor, constant: 125),
            fotoBotao.heightAnchor.constraint(equalToConstant: 120),
            fotoBotao.bottomAnchor.constraint(equalTo: tituloBotao.bottomAnchor),
            fotoBotao.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 250),
            fotoBotao.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
        ]
        NSLayoutConstraint.activate(fotoPassoConstraints)


        
        //Config descricao
//        descricaoPasso.backgroundColor = .blue
        descricaoBotao.self.font = UIFont.systemFont(ofSize: 13.0, weight: .regular)
        descricaoBotao.numberOfLines = 0
        descricaoBotao.translatesAutoresizingMaskIntoConstraints = false
        let descricaoPassoConstraints: [NSLayoutConstraint] = [
            descricaoBotao.topAnchor.constraint(equalTo: tituloBotao.bottomAnchor, constant: 20),
            descricaoBotao.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            descricaoBotao.trailingAnchor.constraint(equalTo: fotoBotao.trailingAnchor)
        ]
        NSLayoutConstraint.activate(descricaoPassoConstraints)

        //Config tabela
        
        tabela.backgroundColor = .clear
        tabela.translatesAutoresizingMaskIntoConstraints = false
        tabela.rowHeight = 60

    }
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
    }

    
}


