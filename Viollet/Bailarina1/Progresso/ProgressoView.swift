//
//  ProgressoView.swift
//  Ballerina 2.1
//
//  Created by Carolina Ortega on 28/07/21.
//


import UIKit

class ProgressoView: UIView {
    var titulo = UILabel()
    var subtitulo = UILabel()

    override init(frame: CGRect) {
        super.init(frame: .zero)
        addSubview(titulo)
        addSubview(subtitulo)

        
        //Config Titulo
        
        titulo.self.text = "Progresso"
        titulo.self.font = UIFont.systemFont(ofSize: 30.0, weight: .medium)
        titulo.self.textAlignment = .left 
        
        //Config Subtitulo

        subtitulo.self.text = "Aqui você consegue acompanhar a sua jornada como bailarina, ver o que você precisa melhorar ou trabalhar mais. Estes dados foram obtidos pela sua reflexão diária."
        subtitulo.self.font = UIFont.systemFont(ofSize: 14.0, weight: .light)
        subtitulo.self.textAlignment = .left
        subtitulo.self.numberOfLines = 0
        

        
        
    
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        titulo.translatesAutoresizingMaskIntoConstraints = false
        let tituloConstraints: [NSLayoutConstraint] = [
            titulo.topAnchor.constraint(equalTo: topAnchor, constant: self.bounds.height * 0.13),
            titulo.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            titulo.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
        ]
        NSLayoutConstraint.activate(tituloConstraints)

        subtitulo.translatesAutoresizingMaskIntoConstraints = false

        let subtituloConstraints: [NSLayoutConstraint] = [
            subtitulo.topAnchor.constraint(equalTo: topAnchor, constant: self.bounds.height * 0.19),
            subtitulo.topAnchor.constraint(equalTo: titulo.bottomAnchor, constant: self.bounds.height * 0.007),
            subtitulo.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            subtitulo.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
        ]
        NSLayoutConstraint.activate(subtituloConstraints)

}

}
