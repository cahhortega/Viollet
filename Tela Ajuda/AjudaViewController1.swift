//
//  AjudaViewController1.swift
//  Ballerina 2.1
//
//  Created by Carolina Ortega on 26/07/21.
//

import UIKit

class AjudaViewController1: UIViewController {
    
    let titulo = UILabel()
    let subtitulo = UILabel()
    let foto = UIImageView(image: #imageLiteral(resourceName: "sapatilha.png"))
    var viollet = UIImageView(image: #imageLiteral(resourceName: "logo.png"))

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(titulo)
        view.addSubview(subtitulo)
        view.addSubview(foto)
        view.addSubview(viollet)

        
        
        self.view.backgroundColor = .systemBackground

        viollet.contentMode = .scaleAspectFit
//        viollet.backgroundColor = .blue
       
        
        // Titulo Config
        titulo.text = " Bem-vinda a          "
        titulo.textAlignment = .left
        titulo.numberOfLines = 0
//        titulo.backgroundColor = .yellow
        titulo.translatesAutoresizingMaskIntoConstraints = false
        titulo.font = UIFont.systemFont(ofSize: 30, weight: .medium)
        let tituloConstraints: [NSLayoutConstraint] = [
//            titulo.widthAnchor.constraint(equalToConstant: 297),
            titulo.heightAnchor.constraint(equalToConstant: 36),
            titulo.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 40),
            titulo.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -40),
            titulo.topAnchor.constraint(equalTo: foto.bottomAnchor, constant: 40)
        ]
        NSLayoutConstraint.activate(tituloConstraints)
        
      
        
        //Subtitulo Config

        subtitulo.text = "O aplicativo que te ajuda a monitorar da melhor forma sua rotina como bailarina."
        subtitulo.textAlignment = .center
        subtitulo.numberOfLines = 0
        subtitulo.translatesAutoresizingMaskIntoConstraints = false
        subtitulo.font = UIFont.systemFont(ofSize: 15, weight: .light)
        
        let subtituloConstraints: [NSLayoutConstraint] = [
            subtitulo.widthAnchor.constraint(equalTo: titulo.widthAnchor),
            subtitulo.leadingAnchor.constraint(equalTo: titulo.leadingAnchor),
            subtitulo.trailingAnchor.constraint(equalTo: titulo.trailingAnchor),
            subtitulo.topAnchor.constraint(equalTo: titulo.bottomAnchor, constant: 20),
            subtitulo.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ]
        NSLayoutConstraint.activate(subtituloConstraints)
        

        foto.clipsToBounds = true
        foto.contentMode = .scaleAspectFit

        
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        NSLog("bounds = \(self.view.bounds.height)")

//        foto.backgroundColor = .yellow
        foto.translatesAutoresizingMaskIntoConstraints = false
        let fotoConstraints: [NSLayoutConstraint] = [
            
            foto.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 70),
            foto.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -70),
            foto.topAnchor.constraint(equalTo: view.topAnchor, constant: view.bounds.height * 0.18),
            foto.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -300),
        ]
        NSLayoutConstraint.activate(fotoConstraints)
        
        viollet.translatesAutoresizingMaskIntoConstraints = false
        
        let violletConstraints: [NSLayoutConstraint] = [
//            titulo.widthAnchor.constraint(equalToConstant: 297),
            viollet.heightAnchor.constraint(equalToConstant: 36),
            viollet.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 215),
            viollet.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -45),
//            titulo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            viollet.topAnchor.constraint(equalTo: titulo.topAnchor, constant: view.bounds.height * -0.20),
            viollet.bottomAnchor.constraint(equalTo: titulo.bottomAnchor, constant: view.bounds.height * 0.195)
        ]
        NSLayoutConstraint.activate(violletConstraints)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
