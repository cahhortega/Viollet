//
//  PerguntasPageViewController.swift
//  Ballerina 2.1
//
//  Created by Carolina Ortega on 26/07/21.
//

import UIKit

class PerguntasPageViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate, PerguntasPageViewControllerDelegate {
    
    
    var contadores: [Int] = [0,0,0,0,0,0] {
        didSet {
            botaoConcluirOk()
        }
    }
    
    
    
    var pages = [UIViewController]()
    let pageControl = UIPageControl()
    
    override init(transitionStyle: UIPageViewController.TransitionStyle, navigationOrientation: UIPageViewController.NavigationOrientation, options: [UIPageViewController.OptionsKey : Any]?){
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: .none)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        
        self.dataSource = self
        self.delegate = self
        let initialPage = 0
        let page1 = ViewController1()
        page1.delegate = self
        let page2 = ViewController2()
        page2.delegate = self
        let page3 = ViewController3()
        page3.delegate = self
        let page4 = ViewController4()
        page4.delegate = self
        let page5 = ViewController5()
        page5.delegate = self
        let page6 = ViewController6()
        page6.delegate = self
        
        
        
        
        // add the individual viewControllers to the pageViewController
        self.pages.append(page1)
        self.pages.append(page2)
        self.pages.append(page3)
        self.pages.append(page4)
        self.pages.append(page5)
        self.pages.append(page6)
        
        
        
        
        
        setViewControllers([pages[initialPage]], direction: .forward, animated: false, completion: nil)
        
        
        //NavigationBar
        navigationController?.navigationBar.isHidden = false
        self.navigationItem.setHidesBackButton(true, animated: true)
        self.navigationItem.title = "Reflexão"
        navigationController?.navigationBar.prefersLargeTitles = false
        
        let botaoCancelar = UIBarButtonItem(title: "Cancelar", style: .plain, target: self, action: #selector(botaoCancelar))
        botaoCancelar.tintColor = #colorLiteral(red: 0.5882352941, green: 0.4862745098, blue: 0.6666666667, alpha: 1)
        self.navigationItem.leftBarButtonItem = botaoCancelar
        
        
        
        let botaoConcluir = UIBarButtonItem(title: " ", style: .plain, target: self, action: #selector(changeViewController2))
        botaoConcluir.tintColor = #colorLiteral(red: 0.5882352941, green: 0.4862745098, blue: 0.6666666667, alpha: 1)
        self.navigationItem.rightBarButtonItem = botaoConcluir
        self.navigationItem.rightBarButtonItem?.isEnabled = false

        //Alerta
        
        let ac = UIAlertController(title: "Reflexão Diária", message: "Todos os dados coletados anteriormente serão deletados.", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK!", style: .cancel, handler: nil))
        ac.view.tintColor = #colorLiteral(red: 0.5882352941, green: 0.4862745098, blue: 0.6666666667, alpha: 1)
        present(ac, animated: true)
        
        
        
        // pageControl
        self.pageControl.numberOfPages = self.pages.count
        self.pageControl.transform = CGAffineTransform(scaleX: 1.6, y: 1.6)
        self.pageControl.frame = CGRect()
        self.pageControl.currentPageIndicatorTintColor = #colorLiteral(red: 0.5882352941, green: 0.4862745098, blue: 0.6666666667, alpha: 1)
        self.pageControl.pageIndicatorTintColor = #colorLiteral(red: 0.8242500424, green: 0.7024413943, blue: 0.8956145644, alpha: 1)
        self.pageControl.currentPage = initialPage
        self.pageControl.isEnabled = false
        self.view.addSubview(self.pageControl)
        
        self.pageControl.translatesAutoresizingMaskIntoConstraints = false
        self.pageControl.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -50).isActive = true
        self.pageControl.widthAnchor.constraint(equalTo: self.view.widthAnchor, constant: -20).isActive = true
        self.pageControl.heightAnchor.constraint(equalToConstant: 20).isActive = true
        self.pageControl.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
    }
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        if let viewControllerIndex = pages.firstIndex(of: viewController) {
            if viewControllerIndex > 0 && viewControllerIndex <= 5 {
                // wrap to last page in array
                return pages[viewControllerIndex - 1]
            }
            
        }
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        if let viewControllerIndex = pages.firstIndex(of: viewController) {
            if viewControllerIndex < pages.count - 1 {
                // go to next page in array
                return pages[viewControllerIndex + 1]
            }
        }
        return nil
    }
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        
        // set the pageControl.currentPage to the index of the current viewController in pages
        if let viewControllers = pageViewController.viewControllers {
            if let viewControllerIndex = self.pages.firstIndex(of: viewControllers[0]) {
                self.pageControl.currentPage = viewControllerIndex
                
            }
        }
    }
    
    @objc func changeViewController(){
        
        let viewcontrollers = self.navigationController?.viewControllers
        
        viewcontrollers?.forEach({ (vc) in
            if  let inventoryListVC = vc as? ExplorarViewController {
                self.navigationController!.popToViewController(inventoryListVC, animated: true)
            }
        })
        
        }
    @objc func changeViewController2() {
        navigationController?.pushViewController(ProgressoViewController(), animated: true)
        
    }
    @objc func popViewController() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func botaoCancelar(){
        let ac2 = UIAlertController(title: "Tem certeza?", message: "Saindo da reflexão você irá perder todo o seu progresso.", preferredStyle: .alert)
        ac2.addAction(UIAlertAction(title: "Sair", style: UIAlertAction.Style.cancel, handler: {(action:UIAlertAction!) in
            self.changeViewController()
        }))
        ac2.addAction(UIAlertAction(title: "Continuar", style: UIAlertAction.Style.default, handler: {(action:UIAlertAction!) in
        
        }))
        present(ac2, animated: true)
        ac2.view.tintColor = #colorLiteral(red: 0.5882352941, green: 0.4862745098, blue: 0.6666666667, alpha: 1)
    }
    
    
    func botaoConcluirOk() {
        if contadores[0] != 0 && contadores[1] != 0 && contadores[2] != 0 && contadores[3] != 0 && contadores[4] != 0 && contadores[5] != 0  {
            self.navigationItem.rightBarButtonItem?.title = "Concluir"
            self.navigationItem.rightBarButtonItem?.isEnabled = true
            UserDefaults.standard.setValue(contadores, forKey: "contadores")
            
        }
    }
    
    func didSelect(weight: Int, index: Int) {
        contadores[index] = weight
    }
    
    
}

protocol PerguntasPageViewControllerDelegate: AnyObject {
    func didSelect (weight: Int, index: Int)
}

