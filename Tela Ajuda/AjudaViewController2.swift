//
//  AjudaViewController2.swift
//  Ballerina 2.1
//
//  Created by Carolina Ortega on 26/07/21.
//

import UIKit

class AjudaViewController2: UIViewController {
    
    let titulo = UILabel()
    let subtitulo = UILabel()
    let foto = UIImageView(image: #imageLiteral(resourceName: "reflexao.png"))

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(titulo)
        view.addSubview(subtitulo)
        view.addSubview(foto)

        
        self.view.backgroundColor = .systemBackground

        // Titulo Config
        titulo.text = "Reflexão"
        titulo.textAlignment = .center
        titulo.numberOfLines = 0
        titulo.translatesAutoresizingMaskIntoConstraints = false
        titulo.font = UIFont.systemFont(ofSize: 30, weight: .medium)
        
        let tituloConstraints: [NSLayoutConstraint] = [
            titulo.widthAnchor.constraint(equalToConstant: 297),
            titulo.heightAnchor.constraint(equalToConstant: 36),
            titulo.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            titulo.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            titulo.topAnchor.constraint(equalTo: foto.bottomAnchor, constant: 40)
        ]
        NSLayoutConstraint.activate(tituloConstraints)
        
        //Subtitulo Config

        subtitulo.text = "Será realizada uma análise do seu progresso através da sua reflexão diária."
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
        
        
        //Foto Config
      
        foto.translatesAutoresizingMaskIntoConstraints = false
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
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
