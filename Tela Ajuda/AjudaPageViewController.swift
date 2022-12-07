//
//  AjudaPageViewController.swift
//  Ballerina 2.1
//
//  Created by Carolina Ortega on 26/07/21.
//


import UIKit

class AjudaPageViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    override init(transitionStyle: UIPageViewController.TransitionStyle, navigationOrientation: UIPageViewController.NavigationOrientation, options: [UIPageViewController.OptionsKey : Any]?){
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: .none)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    var pages = [UIViewController]()
    let pageControl = UIPageControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground

        self.dataSource = self
        self.delegate = self
        let initialPage = 0
        let page1 = AjudaViewController1()
        let page2 = AjudaViewController2()
        let page3 = AjudaViewController3()
        let page4 = AjudaViewController4()
        
        
        
        // add the individual viewControllers to the pageViewController
        self.pages.append(page1)
        self.pages.append(page2)
        self.pages.append(page3)
        self.pages.append(page4)
        
        
        
        setViewControllers([pages[initialPage]], direction: .forward, animated: false, completion: nil)
        
        
        //NavigationBar
        navigationController?.navigationBar.isHidden = false
        self.navigationItem.title = "Ajuda"
        let backButton = UIBarButtonItem()
        backButton.title = "Voltar"
        backButton.tintColor = #colorLiteral(red: 0.5882352941, green: 0.4862745098, blue: 0.6666666667, alpha: 1)
        backButton.action = #selector(popViewController)
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        navigationController?.navigationBar.prefersLargeTitles = false

        
        
        // pageControl
        self.pageControl.numberOfPages = self.pages.count
        self.pageControl.transform = CGAffineTransform(scaleX: 1.6, y: 1.6)
        self.pageControl.frame = CGRect()
        self.pageControl.currentPageIndicatorTintColor = #colorLiteral(red: 0.5882352941, green: 0.4862745098, blue: 0.6666666667, alpha: 1)
        self.pageControl.pageIndicatorTintColor = #colorLiteral(red: 0.8242500424, green: 0.7024413943, blue: 0.8956145644, alpha: 1)
        self.pageControl.isEnabled = false
        self.pageControl.currentPage = initialPage
        self.view.addSubview(self.pageControl)
        
        self.pageControl.translatesAutoresizingMaskIntoConstraints = false
        self.pageControl.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -50).isActive = true
        self.pageControl.widthAnchor.constraint(equalTo: self.view.widthAnchor, constant: -20).isActive = true
        self.pageControl.heightAnchor.constraint(equalToConstant: 20).isActive = true
        self.pageControl.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
    }
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        if let viewControllerIndex = pages.firstIndex(of: viewController) {
            if viewControllerIndex > 0 && viewControllerIndex <= 3 {
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
    @objc func popViewController() {
        navigationController?.popViewController(animated: true)
    }
    
}
