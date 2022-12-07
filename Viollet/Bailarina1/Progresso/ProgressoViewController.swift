//
//  ProgressoViewController.swift
//  Ballerina 2.1
//
//  Created by Carolina Ortega on 28/07/21.
//

import Foundation
import UIKit
import Charts

class ProgressoViewController: UIViewController, ChartViewDelegate, UIPageViewControllerDelegate {
    
    let myView = ProgressoView()
    var barChart = HorizontalBarChartView()
    var secondView = PerguntasPageViewController()
    let label = UILabel()
    var graficoView = UIView()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = myView
        myView.backgroundColor = .systemBackground
        secondView.delegate = self
        barChart.delegate = self
        barChart.animate(yAxisDuration: 2, easingOption: .easeInOutQuart)
        myView.addSubview(graficoView)
        
        
        

     
        let ac = UIAlertController(title: "Progresso", message: "Parece que você não fez a sua reflexão diária.. 😥\n Que tal dar uma passada por lá?", preferredStyle: .alert)
        ac.view.tintColor = #colorLiteral(red: 0.5882352941, green: 0.4862745098, blue: 0.6666666667, alpha: 1)
        ac.addAction(UIAlertAction(title: "OK!", style: UIAlertAction.Style.default, handler: {(action:UIAlertAction!) in
            self.changeViewController1()
        }))
        ac.addAction(UIAlertAction(title: "Agora não", style: UIAlertAction.Style.cancel, handler: {(action:UIAlertAction!) in
            self.popViewController()
        
        }))

        
        navigationController?.navigationBar.isHidden = false
        let backButton = UIBarButtonItem(title: "Voltar", style: .plain, target: self, action: #selector(changeViewController))
        backButton.tintColor = #colorLiteral(red: 0.5882352941, green: 0.4862745098, blue: 0.6666666667, alpha: 1)
        self.navigationItem.leftBarButtonItem = backButton
        self.navigationItem.setHidesBackButton(true, animated: true)
        

        if contadorAtual[0] == 0 && contadorAtual[1] == 0 && contadorAtual[2] == 0 && contadorAtual[3] == 0 && contadorAtual[4] == 0 && contadorAtual[5] == 0 {
            barChart.isHidden = true
            present(ac, animated: true)
        } else{
            prepareHorizontalBarChart()
            barChart.isHidden = false
        }


        }

    open override var shouldAutorotate: Bool {
    get {
        return false
    }
        
    }
    func didSelect(weight: Int, index: Int) {
        secondView.contadores[index] = weight
    }
    
    @objc func changeViewController() {
        let viewcontrollers = self.navigationController?.viewControllers

        viewcontrollers?.forEach({ (vc) in
                if  let inventoryListVC = vc as? ExplorarViewController {
                    self.navigationController!.popToViewController(inventoryListVC, animated: true)
                }
            })
    }

    @objc func changeViewController1() {
        navigationController?.pushViewController(PerguntasPageViewController(), animated: true)
    
    }
    @objc func popViewController() {
        navigationController?.popViewController(animated: true)
    }
    
    func prepareHorizontalBarChart() {
        barChart.frame = CGRect(x: 0, y: 0,
                                    width: 300,
                                    height: 470)




        graficoView.addSubview(barChart)

        var entries1 = [BarChartDataEntry]()
        var entries2 = [BarChartDataEntry]()
        var entries3 = [BarChartDataEntry]()
        var entries4 = [BarChartDataEntry]()
        var entries5 = [BarChartDataEntry]()
        var entries6 = [BarChartDataEntry]()

        let bar1 = BarChartDataEntry(x: Double(5), y: Double(contadorAtual[0]))
        entries1.append(bar1)


        let bar2 = BarChartDataEntry(x: Double(4), y: Double(contadorAtual[1]))
        entries2.append(bar2)

        let bar3 = BarChartDataEntry(x: Double(3), y: Double(contadorAtual[2]))
        entries3.append(bar3)

        let bar4 = BarChartDataEntry(x: Double(2), y: Double(contadorAtual[3]))
        entries4.append(bar4)

        let bar5 = BarChartDataEntry(x: Double(1), y: Double(contadorAtual[4]))
        entries5.append(bar5)

        let bar6 = BarChartDataEntry(x: Double(0), y: Double(contadorAtual[5]))
        entries6.append(bar6)

        let set1 = BarChartDataSet(entries: entries1, label: "Estudo")
        set1.drawIconsEnabled = false

        let set2 = BarChartDataSet(entries: entries2, label: "Autocuidado")
        set2.drawIconsEnabled = false

        let set3 = BarChartDataSet(entries: entries3, label: "Alimentação")
        set3.drawIconsEnabled = false

        let set4 = BarChartDataSet(entries: entries4, label: "Bem-estar")
        set4.drawIconsEnabled = false

        let set5 = BarChartDataSet(entries: entries5, label: "Flexibilidade")
        set5.drawIconsEnabled = false

        let set6 = BarChartDataSet(entries: entries6, label: "Disciplina")
        set6.drawIconsEnabled = false

        set1.colors = [#colorLiteral(red: 0.2196078431, green: 0.4470588235, blue: 0.431372549, alpha: 1)]
        set2.colors = [#colorLiteral(red: 0.3882352941, green: 0.6470588235, blue: 0.631372549, alpha: 1)]
        set3.colors = [#colorLiteral(red: 0.6745098039, green: 0.862745098, blue: 0.8509803922, alpha: 1)]
        set4.colors = [#colorLiteral(red: 0.9334264398, green: 0.7913925648, blue: 1, alpha: 1)]
        set5.colors = [#colorLiteral(red: 0.7825356126, green: 0.595492661, blue: 0.8893032074, alpha: 1)]
        set6.colors = [#colorLiteral(red: 0.3823884428, green: 0.2966182828, blue: 0.423987627, alpha: 1)]


        let data = BarChartData(dataSets: [set1, set2, set3, set4, set5, set6])
        data.barWidth = 0.8
     
//        data.setDrawValues(false)
        

        let formatter = NumberFormatter()
        formatter.numberStyle = .percent
        formatter.maximumFractionDigits = 0
        formatter.multiplier = 1.0
        let defaultValueFormatter = DefaultValueFormatter(formatter: formatter)
        data.setValueFormatter(defaultValueFormatter)


        barChart.zoomOut()
        barChart.fitBars = true
        barChart.data = data
        barChart.isUserInteractionEnabled = false
        
        barChart.leftAxis.axisMinimum = 0.0
        barChart.leftAxis.axisMaximum = 105.0
        barChart.legend.enabled = true
        barChart.legend.verticalAlignment = .bottom
        barChart.legend.horizontalAlignment = .left
        barChart.legend.xEntrySpace = 15
        barChart.legend.yEntrySpace = 20
        barChart.legend.formSize = 20
        barChart.legend.formLineWidth = 300
        barChart.legend.neededHeight = 100

        barChart.scaleYEnabled = false
        barChart.scaleXEnabled = false
        barChart.doubleTapToZoomEnabled = false

        barChart.rightAxis.enabled = false
        barChart.xAxis.drawGridLinesEnabled = false
        barChart.leftAxis.enabled = false

        

        barChart.xAxis.drawGridLinesEnabled = false // disable horizontal grid lines
        barChart.xAxis.enabled = false
        barChart.chartDescription?.enabled = false
        barChart.legend.orientation = .horizontal



    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        NSLog("bounds = \(self.view.bounds.height)")
        graficoView.translatesAutoresizingMaskIntoConstraints = false
        graficoView.topAnchor.constraint(equalTo: myView.subtitulo.bottomAnchor).isActive = true
        graficoView.leadingAnchor.constraint(equalTo: myView.subtitulo.leadingAnchor, constant: 10).isActive = true
        graficoView.trailingAnchor.constraint(equalTo: myView.subtitulo.trailingAnchor, constant: -10).isActive = true
        graficoView.bottomAnchor.constraint(equalTo: myView.bottomAnchor, constant: view.bounds.height * -0.1).isActive = true
    }


}
