//
//  AjudaViewController4.swift
//  Ballerina 2.1
//
//  Created by Carolina Ortega on 27/07/21.
//


import UIKit

class AjudaViewController4: UIViewController {
    
    let titulo = UILabel()
    let subtitulo = UILabel()
//    let botaoContinuar = UIButton(type: .system)
    let foto = UIImageView(image: #imageLiteral(resourceName: "explorar.png"))

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(titulo)
        view.addSubview(subtitulo)
//        view.addSubview(botaoContinuar)
        view.addSubview(foto)
        
        self.view.backgroundColor = .systemBackground
        
        // Titulo Config
        titulo.text = "Explorar"
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

        subtitulo.text = "O objetivo do gráfico é te permitir visualizar quais pontos precisam de sua atenção para melhorar sua performance. Eles podem ser acessados na tela inicial."
        subtitulo.textAlignment = .center
        subtitulo.numberOfLines = 0
        subtitulo.translatesAutoresizingMaskIntoConstraints = false
        subtitulo.font = UIFont.systemFont(ofSize: 15, weight: .light)
        
        let subtituloConstraints: [NSLayoutConstraint] = [
            subtitulo.widthAnchor.constraint(equalTo: titulo.widthAnchor),
            subtitulo.leadingAnchor.constraint(equalTo: titulo.leadingAnchor),
            subtitulo.trailingAnchor.constraint(equalTo: titulo.trailingAnchor),
            subtitulo.topAnchor.constraint(equalTo: titulo.bottomAnchor, constant: 20),
            subtitulo.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -120),
            subtitulo.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ]
        NSLayoutConstraint.activate(subtituloConstraints)
        
        //Botao Config
        
//        botaoContinuar.translatesAutoresizingMaskIntoConstraints = false
//        botaoContinuar.setTitle("Vamos começar?", for: .normal)
//        botaoContinuar.setTitleColor(.black, for: .normal)
//        botaoContinuar.backgroundColor = #colorLiteral(red: 0.6754398942, green: 0.8616247773, blue: 0.849842608, alpha: 1)
//        botaoContinuar.titleLabel?.font = .systemFont(ofSize: 15, weight: .medium)
//        botaoContinuar.layer.cornerRadius = 10
//
//
//
//        botaoContinuar.addTarget(self, action: #selector(changeViewController), for: .touchUpInside)

        //Foto Config
        
        foto.translatesAutoresizingMaskIntoConstraints = false
        foto.clipsToBounds = true
        foto.contentMode = .scaleAspectFit

        
    }
 
    @objc func changeViewController(_ sender: UIButton!) {
        navigationController?.pushViewController(ExplorarViewController(), animated: true)
        
    
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
        
//        let botaoContinuarConstraints: [NSLayoutConstraint] = [
//            botaoContinuar.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            botaoContinuar.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -150),
//            botaoContinuar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -100),
//            botaoContinuar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
//            botaoContinuar.topAnchor.constraint(equalTo: subtitulo.bottomAnchor)
//        ]
//        NSLayoutConstraint.activate(botaoContinuarConstraints)
//
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
