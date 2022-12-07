//
//  BotoesExplorarViewController.swift
//  Ballerina 2.1
//
//  Created by Carolina Ortega on 20/07/21.
//

import Foundation
import UIKit

class BotoesViewController: UIViewController {

    let defaults = UserDefaults.standard
    let imagens: [UIImage] = [#imageLiteral(resourceName: "estudo.png"),#imageLiteral(resourceName: "auto-cuidado.png"),#imageLiteral(resourceName: "alimentacao.png"),#imageLiteral(resourceName: "bem-estar.png"),#imageLiteral(resourceName: "flexibilidade.png"),#imageLiteral(resourceName: "disci.png")]
    let myView = BotoesView()
    let titulos: [String] = ["Estudo", "Autocuidado", "Alimentação", "Bem-estar", "Flexibilidade", "Disciplina"]
    let descricoesBotao: [String] = [
        "O aprendizado é essencial para um bom aproveitamento da aula. Esta página irá te ajudar a se preparar didaticamente para ser uma bailarina.",
        "Tomar cuidados consigo mesma é importante para que sua relação com as outras pessoas seja boa. Esta página irá te ajudar a se autoavailiar como bailarina.",
        "A rotina de uma bailarina é muito focada no que ela come. Esta página irá te ajudar a manter o foco em alimentação saudável para ter um melhor desempenho como bailarina.",
        "A dança também possui um espaço para relaxamento e reflexão. Esta página irá te mostrar porque esse aprendizado é primordial e como ele funciona.",
        "Muitos passos no Ballet são diretamente relacionados com flexibilidade. Esta página irá te mostrar que é possível treinar e melhorar algo que parece impossível aos olhos de uma bailarina.",
        "Desde um movimento simples até uma coreografia complexa, tudo está relacionado à disciplina. Esta página irá te ajudar a se autodisciplinar para ser uma bailarina excepcional.",
    ]
    
    //Conteúdo das tableViews
    let tarefasEstudo: [String] = ["📘 Aprender os nomes dos passos", "💭 Criar técnicas de memorização", "📝 Anotar as coreografias", "🗣 Falar uma sequência em voz alta", "🩰 Pesquisar a origem do Ballet", "❓ Tirar suas dúvidas com professores", "💃 Imitar profissionais"]
    let descricoesEstudo: [String] = ["Nosso dicionário pode te ajudar!", "Criar macetes e músicas não ajuda só na matemática.", "Isso ajuda na hora de decorar.", "Repetir para si mesmo algo até entrar na sua cabeça.", "Vamos começar do início...", "Uma boa bailarina tem uma grande professora!", "Pense como Baryshnikov!"]
    
    let tarefasAlim: [String] = ["⚖️ Fazer uma dieta balanceada", "🥦 Substituir carboidratos por vegetais", "📆 Criar um cronograma alimentar", "🍴 Comer periodicamente", "🍭 Cortar alimentos com muito açúcar", "🍺 Evitar bebidas alcólicas", "🥗 Escolher alimentos saudáveis"]
    let descricoesAlim: [String] = ["Dieta não é sinônimo de sacrifício.", "Carboidrato é (quase) seu inimigo!", "Ter uma rotina é a melhor escolha!", "Não é preciso parar de comer para ser saudável. ", "Doces são gostosos, mas não exagere!", "Beba com moderação.", "Sua energia é a prioridade!"]
    
    let tarefasDisci: [String] = [ "📱 Ativar as nossas notificações", "❌ Não faltar às aulas", "📒 Ter uma agenda para compromissos", "👩‍🏫 Confiar em seu professor", "⏰ Criar um cronograma", "🎒 Preparar sua mochila antes da aula", "🚀 Criar objetivos"]
    let descricoesDisci: [String] = ["Todo dia com a gente!", "Falta = Conteúdo atrasado", "Anotar te ajuda a não esquecer!", "Quem estudou para dar aula merece sua confiança.",  "O relógio é seu melhor amigo!", "Sapatilha, ponteira, colant, tutu, e muita energia!", "Tenha motivação para ser uma pessoa melhor."]
    
    let tarefasAuto: [String] = ["💆‍♀️ Separar um tempo para si mesmo", "🪁 Fazer coisas que você goste", "🤕 Evitar coisas que irão te machucar", "👨‍👩‍👦 Passar um tempo com amigos", "💌 Viver um dia de cada vez", "🚿 Tomar um banho relaxante", "🎶 Escutar músicas que te agradam" ]
    let descricoesAuto: [String] =  ["Tire um tempo do seu dia para se curtir! ", "Pratique um hobby!", "Você escolhe o que sua mente deve absorver.", "Saiba que você não está sozinho!", "Mesmo seus piores dias têm apenas 24 horas.", "Um bom banho pode ser o melhor remédio.", "A melhor forma de fugir da realidade por um tempo."]
    
    let tarefasBem: [String] = ["🤸‍♀️ Fazer alongamento",  "🚶‍♀️ Manter a postura corporal correta", "💬 Conversar com pessoas", "🚰 Beber muita água", "🧘‍♀️ Meditar", "📚 Analisar suas motivações ", "💤 Ter o sono sempre regulado"]
    let descricoesBem: [String] = ["Para começar o dia com o pé direito!", "Evite dores futuras!", "É sempre bom ter uma visão diferente da vida.", "Manter-se hidratado é essencial.", "Tenha reflexões sobre como será seu dia!", "Um planner é uma boa opção!", "Durma por pelo menos 8 horas."]

    let tarefasFlex: [String] = ["⏳ Preparar-se", "🪢 Marcar seus objetivos", "🧠 Relaxar a mente", "🥳 Persistir dia após dia", "📸 Fotografar seu progresso", "🌬️ Respirar corretamente", "📊 Respeitar seus limites"]
    let descricoesFlex: [String] = ["Faça um alongamento, ou um exercício inicial.", "Comece criando metas!", "Nossa mente influencia diretamente nossas ações.", "Vibre cada pequena conquista obtida!", "É a melhor forma de se analisar.", "Isso te ajuda a relaxar e melhorar sua performance.", "Você é capaz, mas não precisa ir além do permitido."]

 
   
    open override var shouldAutorotate: Bool {
    get {
        return false
    }
    }
    
    override func loadView() {
        super.loadView()
        view = myView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myView.backgroundColor = .systemBackground
        
        myView.tituloBotao.text = self.titulos[botaoAtual] //Acessando o index da lista
        myView.descricaoBotao.text = self.descricoesBotao[botaoAtual]
        myView.fotoBotao.image = self.imagens[botaoAtual]
        
            //Aparecer botao de dicionario
        if myView.tituloBotao.text == self.titulos[0] {
            myView.botaoDicionario.isEnabled = true
            myView.botaoDicionario.isHidden = false
        
            //Tamanho da tabela
        let tabelaConstraints: [NSLayoutConstraint] = [
            myView.tabela.topAnchor.constraint(equalTo: myView.descricaoBotao.bottomAnchor, constant: 20),
            myView.tabela.trailingAnchor.constraint(equalTo: myView.trailingAnchor, constant: -30),
            myView.tabela.leadingAnchor.constraint(equalTo: myView.leadingAnchor, constant: 30),
            myView.tabela.bottomAnchor.constraint(equalTo: myView.bottomAnchor, constant: -150)
        
        ]
        NSLayoutConstraint.activate(tabelaConstraints)
        } else if myView.tituloBotao.text == self.titulos[2] || myView.tituloBotao.text == self.titulos[4] || myView.tituloBotao.text == self.titulos[5] {
            let tabelaConstraints: [NSLayoutConstraint] = [
                myView.tabela.topAnchor.constraint(equalTo: myView.descricaoBotao.bottomAnchor, constant: 20),
                myView.tabela.trailingAnchor.constraint(equalTo: myView.trailingAnchor, constant: -30),
                myView.tabela.leadingAnchor.constraint(equalTo: myView.leadingAnchor, constant: 30),
                myView.tabela.bottomAnchor.constraint(equalTo: myView.bottomAnchor, constant: -80)
         
            ]
            NSLayoutConstraint.activate(tabelaConstraints)
        } else {
            let tabelaConstraints: [NSLayoutConstraint] = [
                myView.tabela.topAnchor.constraint(equalTo: myView.descricaoBotao.bottomAnchor, constant: 20),
                myView.tabela.trailingAnchor.constraint(equalTo: myView.trailingAnchor, constant: -30),
                myView.tabela.leadingAnchor.constraint(equalTo: myView.leadingAnchor, constant: 30),
                myView.tabela.bottomAnchor.constraint(equalTo: myView.bottomAnchor, constant: -100)
         
            ]
            NSLayoutConstraint.activate(tabelaConstraints)
        }
        
        myView.tabela.reloadData()
        myView.tabela.dataSource = self
        myView.tabela.delegate = self
        myView.tabela.register(UITableViewCell.self, forCellReuseIdentifier: "TableViewCell")

        
        myView.botaoDicionario.addTarget(self, action: #selector(changeViewController), for: .touchUpInside)

        navigationController?.navigationBar.isHidden = false
        let backButton = UIBarButtonItem()
        backButton.title = "Voltar"
        backButton.tintColor = #colorLiteral(red: 0.5882352941, green: 0.4862745098, blue: 0.6666666667, alpha: 1)
        backButton.action = #selector(changeViewController)
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        
    }
    
    @objc func popViewController() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func changeViewController(_ sender: UIButton!) {
        switch sender {
            case myView.botaoDicionario:
                navigationController?.pushViewController(PassosCollectionViewController(), animated: true)
          
            default:
                navigationController?.navigationBar.isHidden = true
                navigationController?.popToRootViewController(animated: true)
                
        }
    }

}

extension BotoesViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: "cellId")
        cell.backgroundColor = .clear
        
        cell.textLabel?.font = UIFont.systemFont(ofSize: 17.0, weight: .regular)

        cell.textLabel?.translatesAutoresizingMaskIntoConstraints = false
        cell.textLabel?.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
        cell.detailTextLabel?.font = UIFont.systemFont(ofSize: 11.5, weight: .light)
        cell.detailTextLabel?.textColor = #colorLiteral(red: 0.4078431373, green: 0.4078431373, blue: 0.4078431373, alpha: 1)
        
        cell.isUserInteractionEnabled = false
        
        //TableViews para conteúdos diferentes
        if myView.tituloBotao.text == self.titulos[0]{
            cell.textLabel?.text = self.tarefasEstudo[indexPath.row]
            cell.detailTextLabel?.text = self.descricoesEstudo[indexPath.row]
            
        } else if myView.tituloBotao.text == self.titulos[1]{
            cell.textLabel?.text = self.tarefasAuto[indexPath.row]
            cell.detailTextLabel?.text = self.descricoesAuto[indexPath.row]
            
        } else if myView.tituloBotao.text == self.titulos[2]{
            cell.textLabel?.text = self.tarefasAlim[indexPath.row]
            cell.detailTextLabel?.text = self.descricoesAlim[indexPath.row]
            
        } else if myView.tituloBotao.text == self.titulos[3]{
            cell.textLabel?.text = self.tarefasBem[indexPath.row]
            cell.detailTextLabel?.text = self.descricoesBem[indexPath.row]
            
        } else if myView.tituloBotao.text == self.titulos[4]{
            cell.textLabel?.text = self.tarefasFlex[indexPath.row]
            cell.detailTextLabel?.text = self.descricoesFlex[indexPath.row]
            
        } else{
            cell.textLabel?.text = self.tarefasDisci[indexPath.row]
            cell.detailTextLabel?.text = self.descricoesDisci[indexPath.row]
        }
         return cell
    }

}


