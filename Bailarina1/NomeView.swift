//
//  NomeView.swift
//  Ballerina 2.1
//
//  Created by Carolina Ortega on 20/07/21.
//


import UIKit

class NomeView: UIView {
    var titulo = UILabel()
    var viollet = UIImageView(image: #imageLiteral(resourceName: "logo.png"))
    var nome = UITextField()
    var bailarinaInicial = UIImageView(image: #imageLiteral(resourceName: "oi.png"))
    var botaoContinuar = UIButton()

    override init(frame: CGRect) {
        super.init(frame: .zero)
        backgroundColor = .systemBackground
        addSubview(titulo)
        addSubview(viollet)
        addSubview(bailarinaInicial)
        addSubview(nome)
        addSubview(botaoContinuar)
        
        //Config foto
    
        bailarinaInicial.contentMode = .scaleAspectFit
        viollet.contentMode = .scaleAspectFit
        
//        Config Viollet
        
//        viollet.self.text = "Viollet!"
//        viollet.self.numberOfLines = 0
////        titulo.self.backgroundColor = .yellow
//        viollet.textColor = #colorLiteral(red: 0.7529411765, green: 0.6078431373, blue: 0.8705882353, alpha: 1)
//        viollet.self.font = UIFont.systemFont(ofSize: 28, weight: .medium)
//        viollet.self.textAlignment = .left



        //Config Titulo
        
            titulo.self.text = "Olá.\nEu sou a"
            titulo.self.numberOfLines = 0
    //        titulo.self.backgroundColor = .yellow
            titulo.self.font = UIFont.systemFont(ofSize: 28, weight: .medium)
            titulo.self.textAlignment = .left
            titulo.translatesAutoresizingMaskIntoConstraints = false
        let tituloConstraints: [NSLayoutConstraint] = [
            titulo.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            titulo.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -100),
    //        titulo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titulo.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -65)
        ]
        NSLayoutConstraint.activate(tituloConstraints)
        
        
        //Config TextField
        
        nome.translatesAutoresizingMaskIntoConstraints = false
        nome.center = self.center
        nome.borderStyle = UITextField.BorderStyle.line
//        nome.layer.borderColor = #colorLiteral(red: 0.7137254902, green: 0.768627451, blue: 0.537254902, alpha: 1)
//        nome.layer.borderWidth = 1
        nome.layer.cornerRadius = 5
        nome.backgroundColor = .secondarySystemFill
        nome.keyboardType = UIKeyboardType.default
        nome.borderStyle = UITextField.BorderStyle.roundedRect
        nome.clearButtonMode = UITextField.ViewMode.whileEditing
        nome.returnKeyType = UIReturnKeyType.done
        nome.placeholder = "Qual é o seu nome?"
        
        let nomeConstraints: [NSLayoutConstraint] = [
            nome.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            nome.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            nome.centerYAnchor.constraint(equalTo: centerYAnchor)
        ]
        NSLayoutConstraint.activate(nomeConstraints)
        
        //Config Botao Continuar
        
        botaoContinuar.translatesAutoresizingMaskIntoConstraints = false
        botaoContinuar.setTitle("Continuar", for: .normal)
        botaoContinuar.setTitleColor(.black, for: .normal)
        botaoContinuar.backgroundColor = #colorLiteral(red: 0.6745098039, green: 0.862745098, blue: 0.8509803922, alpha: 1)
        botaoContinuar.titleLabel?.font = .systemFont(ofSize: 17, weight: .regular)
        botaoContinuar.layer.cornerRadius = 5
        
       
        
//        viollet.backgroundColor = .red

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        bailarinaInicial.translatesAutoresizingMaskIntoConstraints = false
        bailarinaInicial.topAnchor.constraint(equalTo: self.topAnchor, constant: self.bounds.height * 0.30).isActive = true
        bailarinaInicial.bottomAnchor.constraint(equalTo: nome.topAnchor).isActive = true
//        bailarinaInicial.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        bailarinaInicial.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: self.bounds.width * 0.25).isActive = true
        bailarinaInicial.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: self.bounds.width * 0.30).isActive = true
    
        viollet.translatesAutoresizingMaskIntoConstraints = false
        let violletConstraints: [NSLayoutConstraint] = [
            viollet.widthAnchor.constraint(equalToConstant: self.bounds.width * 0.120),
            viollet.trailingAnchor.constraint(equalTo: trailingAnchor, constant: self.bounds.width * -0.36),
            viollet.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 137),

            viollet.bottomAnchor.constraint(equalTo: nome.topAnchor, constant: -1),
//            viollet.topAnchor.constraint(equalTo: topAnchor, constant: self.bounds.height * 0.4)

        ]
        NSLayoutConstraint.activate(violletConstraints)
        
        let botaoContinuarConstraints: [NSLayoutConstraint] = [
            botaoContinuar.leadingAnchor.constraint(equalTo: leadingAnchor, constant: self.bounds.width * 0.5),
            botaoContinuar.trailingAnchor.constraint(equalTo: nome.trailingAnchor),
            botaoContinuar.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 50)
        ]
        NSLayoutConstraint.activate(botaoContinuarConstraints)
    }
    
}

 
