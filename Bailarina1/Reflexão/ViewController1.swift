//
//  ViewController1.swift
//  Ballerina 2.1
//
//  Created by Carolina Ortega on 26/07/21.
//

import UIKit


class ViewController1: UIViewController {
    
    let opcao1 = UIButton()
    let opcao2 = UIButton()
    let opcao3 = UIButton()
    let opcao4 = UIButton()
    let titulo = UILabel()
    let subtitulo = UILabel()
    static var contador = 0
    weak var delegate: PerguntasPageViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        view.addSubview(opcao1)
        view.addSubview(opcao2)
        view.addSubview(opcao3)
        view.addSubview(opcao4)
        view.addSubview(titulo)
        view.addSubview(subtitulo)
        
        // Config titulo
        
        titulo.text = "Estudo"
        titulo.translatesAutoresizingMaskIntoConstraints = false
        titulo.font = UIFont.systemFont(ofSize: 30, weight: .medium)
     
        
        // Config Subtitulo
        
        subtitulo.text = "Você conseguiu entender tudo que foi apresentado pela professora na aula de hoje?"
        subtitulo.translatesAutoresizingMaskIntoConstraints = false
        subtitulo.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        subtitulo.numberOfLines = 0


        // Config botoes
        opcao1.translatesAutoresizingMaskIntoConstraints = false
        opcao1.setTitle("😆 \n Sim! Consegui entender tudo perfeitamente. \n Não preciso de ajuda.", for: .normal)
        opcao1.setTitleColor(.purple, for: .highlighted)
        opcao1.setTitleColor(.black, for: .normal)
        opcao1.backgroundColor = #colorLiteral(red: 0.6745098039, green: 0.862745098, blue: 0.8509803922, alpha: 1)
        opcao1.titleLabel?.font = .systemFont(ofSize: 13.5, weight: .medium)
        opcao1.titleLabel?.numberOfLines = 0
        opcao1.titleLabel?.textAlignment = .center
        opcao1.layer.cornerRadius = 10
        opcao1.addTarget(self, action: #selector(botao1), for: .touchUpInside)
        
       
        opcao2.translatesAutoresizingMaskIntoConstraints = false
        opcao2.setTitle("😊 \n Entendi alguns passos, outros eu não sabia o nome. \n Preciso de um pouco de ajuda.", for: .normal)
        opcao2.setTitleColor(.black, for: .normal)
        opcao2.backgroundColor = #colorLiteral(red: 0.6745098039, green: 0.862745098, blue: 0.8509803922, alpha: 1)
        opcao2.titleLabel?.font = .systemFont(ofSize: 13.5, weight: .medium)
        opcao2.titleLabel?.numberOfLines = 0
        opcao2.titleLabel?.textAlignment = .center
        opcao2.layer.cornerRadius = 10

        opcao2.addTarget(self, action: #selector(botao2), for: .touchUpInside)


        opcao3.translatesAutoresizingMaskIntoConstraints = false
        opcao3.setTitle("😕 \n Não lembrava os nomes dos passos, mas aprendi algo. \n Preciso de ajuda.", for: .normal)
        opcao3.titleLabel?.translatesAutoresizingMaskIntoConstraints = false
        opcao3.setTitleColor(.black, for: .normal)
        opcao3.backgroundColor = #colorLiteral(red: 0.6745098039, green: 0.862745098, blue: 0.8509803922, alpha: 1)
        opcao3.titleLabel?.font = .systemFont(ofSize: 13.5, weight: .medium)
        opcao3.titleLabel?.numberOfLines = 0
        opcao3.titleLabel?.textAlignment = .center
        opcao3.layer.cornerRadius = 10
  
        opcao3.addTarget(self, action: #selector(botao3), for: .touchUpInside)

        
        opcao4.translatesAutoresizingMaskIntoConstraints = false
        opcao4.setTitle("😢 \n Não lembrava o nome de nenhum passo e não consegui aprender nada na aula. \n Preciso de muita ajuda.", for: .normal)
        opcao4.setTitleColor(.black, for: .normal)
        opcao4.backgroundColor = #colorLiteral(red: 0.6745098039, green: 0.862745098, blue: 0.8509803922, alpha: 1)
        opcao4.titleLabel?.font = .systemFont(ofSize: 13.5, weight: .medium)
        opcao4.titleLabel?.numberOfLines = 0
        opcao4.titleLabel?.textAlignment = .center
        opcao4.layer.cornerRadius = 10
  
        opcao4.addTarget(self, action: #selector(botao4), for: .touchUpInside)
        

        
    }
    
    @objc func botao1() {
        if !opcao1.isSelected{
            opcao1.backgroundColor = #colorLiteral(red: 0.3882352941, green: 0.6470588235, blue: 0.631372549, alpha: 1)
            opcao2.backgroundColor = #colorLiteral(red: 0.6745098039, green: 0.862745098, blue: 0.8509803922, alpha: 1)
            opcao3.backgroundColor = #colorLiteral(red: 0.6745098039, green: 0.862745098, blue: 0.8509803922, alpha: 1)
            opcao4.backgroundColor = #colorLiteral(red: 0.6745098039, green: 0.862745098, blue: 0.8509803922, alpha: 1)
            updateContador(valor: 100)

        } else {
            opcao1.backgroundColor = #colorLiteral(red: 0.6745098039, green: 0.862745098, blue: 0.8509803922, alpha: 1)
        }
    }
    @objc func botao2() {
        if !opcao2.isSelected{
            opcao2.backgroundColor = #colorLiteral(red: 0.3882352941, green: 0.6470588235, blue: 0.631372549, alpha: 1)
            updateContador(valor: 60)
            opcao1.backgroundColor = #colorLiteral(red: 0.6745098039, green: 0.862745098, blue: 0.8509803922, alpha: 1)
            opcao3.backgroundColor = #colorLiteral(red: 0.6745098039, green: 0.862745098, blue: 0.8509803922, alpha: 1)
            opcao4.backgroundColor = #colorLiteral(red: 0.6745098039, green: 0.862745098, blue: 0.8509803922, alpha: 1)
        } else {
            opcao2.backgroundColor = #colorLiteral(red: 0.6745098039, green: 0.862745098, blue: 0.8509803922, alpha: 1)
        }
        
    }
    @objc func botao3() {
        if !opcao3.isSelected{
            opcao3.backgroundColor = #colorLiteral(red: 0.3882352941, green: 0.6470588235, blue: 0.631372549, alpha: 1)
            updateContador(valor: 30)
            opcao1.backgroundColor = #colorLiteral(red: 0.6745098039, green: 0.862745098, blue: 0.8509803922, alpha: 1)
            opcao2.backgroundColor = #colorLiteral(red: 0.6745098039, green: 0.862745098, blue: 0.8509803922, alpha: 1)
            opcao4.backgroundColor = #colorLiteral(red: 0.6745098039, green: 0.862745098, blue: 0.8509803922, alpha: 1)
        } else {
            opcao3.backgroundColor = #colorLiteral(red: 0.6745098039, green: 0.862745098, blue: 0.8509803922, alpha: 1)
        }
        
    }
    @objc func botao4() {
        if !opcao4.isSelected{
            opcao4.backgroundColor = #colorLiteral(red: 0.3882352941, green: 0.6470588235, blue: 0.631372549, alpha: 1)
            updateContador(valor: 10)
            opcao1.backgroundColor = #colorLiteral(red: 0.6745098039, green: 0.862745098, blue: 0.8509803922, alpha: 1)
            opcao2.backgroundColor = #colorLiteral(red: 0.6745098039, green: 0.862745098, blue: 0.8509803922, alpha: 1)
            opcao3.backgroundColor = #colorLiteral(red: 0.6745098039, green: 0.862745098, blue: 0.8509803922, alpha: 1)

        } else {
            opcao4.backgroundColor = #colorLiteral(red: 0.6745098039, green: 0.862745098, blue: 0.8509803922, alpha: 1)
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        NSLog("bounds = \(self.view.bounds.height)")

        titulo.translatesAutoresizingMaskIntoConstraints = false
        let tituloConstraints: [NSLayoutConstraint] = [
            titulo.topAnchor.constraint(equalTo: view.topAnchor, constant: view.bounds.height * 0.13),
            titulo.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titulo.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ]
        NSLayoutConstraint.activate(tituloConstraints)
        let subtituloConstraints: [NSLayoutConstraint] = [
            subtitulo.topAnchor.constraint(equalTo: view.topAnchor, constant: view.bounds.height * 0.18),
            subtitulo.topAnchor.constraint(equalTo: titulo.bottomAnchor, constant: view.bounds.height * 0.007),
            subtitulo.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            subtitulo.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
        ]
        NSLayoutConstraint.activate(subtituloConstraints)
        let opcao1Constraints: [NSLayoutConstraint] = [
            opcao1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: view.bounds.height * 0.02),
            opcao1.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: view.bounds.height * -0.02),
            opcao1.topAnchor.constraint(equalTo: subtitulo.bottomAnchor, constant: view.bounds.height * 0.02),
            opcao1.heightAnchor.constraint(equalToConstant: view.bounds.height * 0.135)
        ]
        NSLayoutConstraint.activate(opcao1Constraints)
        
        let opcao2Constraints: [NSLayoutConstraint] = [
            opcao2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: view.bounds.height * 0.02),
            opcao2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: view.bounds.height * -0.02),
            opcao2.topAnchor.constraint(equalTo: opcao1.bottomAnchor, constant: view.bounds.height * 0.02),
            opcao2.heightAnchor.constraint(equalToConstant: view.bounds.height * 0.135)

        ]
        NSLayoutConstraint.activate(opcao2Constraints)
        
        let opcao3Constraints: [NSLayoutConstraint] = [
            opcao3.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: view.bounds.height * 0.02),
            opcao3.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: view.bounds.height * -0.02),
            opcao3.topAnchor.constraint(equalTo: opcao2.bottomAnchor, constant: view.bounds.height * 0.02),
            opcao3.heightAnchor.constraint(equalToConstant: view.bounds.height * 0.135)

        ]
        NSLayoutConstraint.activate(opcao3Constraints)
        
        let opcao4Constraints: [NSLayoutConstraint] = [
            opcao4.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: view.bounds.height * 0.02),
            opcao4.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: view.bounds.height * -0.02),
            opcao4.topAnchor.constraint(equalTo: opcao3.bottomAnchor, constant: view.bounds.height * 0.02),
            opcao4.heightAnchor.constraint(equalToConstant: view.bounds.height * 0.135)

        ]
        NSLayoutConstraint.activate(opcao4Constraints)
        
    }
    
    func updateContador(valor: Int){
        delegate?.didSelect(weight: valor, index: 0)
    }
}

