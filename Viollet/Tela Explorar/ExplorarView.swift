//
//  ExplorarView.swift
//  Ballerina
//
//  Created by Carolina Ortega on 18/07/21.
//

import Foundation
import UIKit

struct ExplorarData {
    var tag: Int
    var image: UIImage
    var title: String
    
}


class ExplorarView: UIView {
    let titulo = UILabel()
    let fraseView = FraseView()
    let explorar = UILabel()
    let frase = UILabel()
    let fundoFrase = UIView()
    let botaoReflexao = UIButton(type: .system)
    let botaoProgresso = UIButton(type: .system)
    let botaoAjuda = UIButton()
    let configIcon = UIImage.SymbolConfiguration(pointSize: 25, weight: .light, scale: .large)
    let explorarData = [
        ExplorarData(tag: 0, image: UIImage(named: "estudo.png")!, title: "Estudo"),
        ExplorarData(tag: 1, image: UIImage(named: "auto-cuidado.png")!, title: "Autocuidado"),
        ExplorarData(tag: 2, image: UIImage(named: "alimentacao.png")!, title: "Alimentação"),
        ExplorarData(tag: 3, image: UIImage(named: "bem-estar.png")!, title: "Bem-estar"),
        ExplorarData(tag: 4, image: UIImage(named: "flexibilidade.png")!, title: "Flexibilidade"),
        ExplorarData(tag: 5, image: UIImage(named: "disci.png")!, title: "Disciplina"),
        
        
    ]
    
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        layout.minimumInteritemSpacing = 20
        layout.minimumLineSpacing = 20
        cv.register(ExplorarCell.self, forCellWithReuseIdentifier: "cell")
        return cv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        backgroundColor = .systemBackground
        addSubview(fundoFrase)
        addSubview(frase)
        addSubview(titulo)
        addSubview(explorar)
        addSubview(botaoReflexao)
        addSubview(botaoProgresso)
        addSubview(collectionView)
        addSubview(botaoAjuda)
        
        
        //Config Titulo
        
        
        titulo.text = "Olá, \(UserDefaults.standard.string(forKey: "nome") ?? "")!"
        titulo.font = UIFont.systemFont(ofSize: 32.0, weight: .semibold)
        titulo.textAlignment = .right
        titulo.translatesAutoresizingMaskIntoConstraints = false
        let tituloConstraints: [NSLayoutConstraint] = [
            titulo.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            titulo.topAnchor.constraint(equalTo: topAnchor, constant: 70)
        ]
        NSLayoutConstraint.activate(tituloConstraints)
        
        //Config Explorar
        
        explorar.text = "Explorar"
        //        explorar.backgroundColor = .red
        explorar.font = UIFont.systemFont(ofSize: 25.0, weight: .medium)
        explorar.textAlignment = .left
        explorar.translatesAutoresizingMaskIntoConstraints = false
        let explorarConstraints: [NSLayoutConstraint] = [
            explorar.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            explorar.topAnchor.constraint(equalTo: topAnchor, constant: 270),
            explorar.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
        ]
        NSLayoutConstraint.activate(explorarConstraints)
        
        //Config Botao Reflexao
        
        botaoReflexao.translatesAutoresizingMaskIntoConstraints = false
        botaoReflexao.setTitle("Reflexão", for: .normal)
        botaoReflexao.setTitleColor(.black, for: .normal)
        botaoReflexao.backgroundColor = #colorLiteral(red: 0.6745098039, green: 0.862745098, blue: 0.8509803922, alpha: 1)
        botaoReflexao.titleLabel?.font = .systemFont(ofSize: 15, weight: .medium)
        botaoReflexao.layer.cornerRadius = 10
        
        
        
        //Config Botao Progresso
        
        botaoProgresso.translatesAutoresizingMaskIntoConstraints = false
        botaoProgresso.setTitle("Progresso", for: .normal)
        botaoProgresso.setTitleColor(.black, for: .normal)
        botaoProgresso.backgroundColor = #colorLiteral(red: 0.6754398942, green: 0.8616247773, blue: 0.849842608, alpha: 1)
        botaoProgresso.titleLabel?.font = .systemFont(ofSize: 15, weight: .medium)
        botaoProgresso.layer.cornerRadius = 10
        
        
        
        
        //Config botaoAjuda
        botaoAjuda.setImage(UIImage(systemName: "questionmark.circle.fill", withConfiguration: configIcon), for: .normal)
        botaoAjuda.translatesAutoresizingMaskIntoConstraints = false
        botaoAjuda.tintColor = #colorLiteral(red: 0.6745098039, green: 0.862745098, blue: 0.8509803922, alpha: 1)
        botaoAjuda.clipsToBounds = true
        
        let botaoAjudaConstraints: [NSLayoutConstraint] = [
//            botaoAjuda.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 300),
            botaoAjuda.trailingAnchor.constraint(equalTo: frase.trailingAnchor, constant: 10),
            botaoAjuda.topAnchor.constraint(equalTo: titulo.topAnchor),
            botaoAjuda.bottomAnchor.constraint(equalTo: titulo.bottomAnchor)
            
        ]
        NSLayoutConstraint.activate(botaoAjudaConstraints)
        
        // Config Collection View
        collectionView.backgroundColor = .clear
        let collectionViewConstraints: [NSLayoutConstraint] = [
            collectionView.centerXAnchor.constraint(equalTo: centerXAnchor),
//            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 35),
//            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -35),
            collectionView.topAnchor.constraint(equalTo: explorar.topAnchor, constant: 45),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            collectionView.widthAnchor.constraint(equalToConstant: 320)
        ]
        NSLayoutConstraint.activate(collectionViewConstraints)
        
        //Config frase
        
        frase.translatesAutoresizingMaskIntoConstraints = false
        frase.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        frase.topAnchor.constraint(equalTo: topAnchor, constant: 125).isActive = true
        frase.bottomAnchor.constraint(equalTo: explorar.topAnchor, constant: -65).isActive = true
        frase.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50).isActive = true
        frase.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50).isActive = true
        frase.clipsToBounds = true

    
        fundoFrase.translatesAutoresizingMaskIntoConstraints = false
        fundoFrase.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        fundoFrase.topAnchor.constraint(equalTo: topAnchor, constant: 120).isActive = true
        fundoFrase.bottomAnchor.constraint(equalTo: explorar.topAnchor, constant: -60).isActive = true
        fundoFrase.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30).isActive = true
        fundoFrase.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30).isActive = true
        fundoFrase.clipsToBounds = true
        fundoFrase.layer.cornerRadius = 16
        fundoFrase.backgroundColor = #colorLiteral(red: 0.9008278251, green: 0.8397245407, blue: 0.9364857078, alpha: 1)

        
        let numeroFrase = Int.random(in: 0..<fraseView.frases.count)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 3
        let attrString = NSMutableAttributedString(
            string: fraseView.frases[numeroFrase],
            attributes: [
                .foregroundColor: UIColor.black,
                .font: UIFont.systemFont(ofSize: 20, weight: .light)])
        
        attrString.addAttribute(.font, value: UIFont.systemFont(ofSize: 11.5, weight: .light), range: (attrString.string as NSString).range(of: fraseView.frases[numeroFrase]))
        attrString.addAttribute(.font, value: UIFont.systemFont(ofSize: 14, weight: .bold), range: (attrString.string as NSString).range(of: fraseView.highlight[numeroFrase]))
        attrString.addAttribute(.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attrString.length))
        frase.attributedText = attrString
        frase.textAlignment = .left
        frase.numberOfLines = 0
        
        
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        
        botaoReflexao.leadingAnchor.constraint(equalTo: fundoFrase.leadingAnchor).isActive = true
        botaoReflexao.trailingAnchor.constraint(equalTo: centerXAnchor, constant: -10).isActive = true
        botaoReflexao.topAnchor.constraint(equalTo: frase.bottomAnchor, constant: 17).isActive = true
        botaoReflexao.bottomAnchor.constraint(equalTo: explorar.topAnchor, constant: -10).isActive = true
        
        botaoProgresso.leadingAnchor.constraint(equalTo: centerXAnchor, constant: 10).isActive = true
        botaoProgresso.trailingAnchor.constraint(equalTo: fundoFrase.trailingAnchor).isActive = true
        botaoProgresso.topAnchor.constraint(equalTo: frase.bottomAnchor, constant: 17).isActive = true
        botaoProgresso.bottomAnchor.constraint(equalTo: explorar.topAnchor, constant: -10).isActive = true
        
        
    }

    
    
}

