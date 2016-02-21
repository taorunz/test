//
//  SecondViewController.swift
//  chartsTest
//
//  Created by trz on 16/2/14.
//  Copyright © 2016年 trz. All rights reserved.
//

import UIKit
import Charts

class SecondViewController: UIViewController {
    
    //MARK: Properties
    
    @IBOutlet weak var lineChart: LineChartView!
    @IBOutlet weak var labelTest: UILabel!
    
    //MARK: Chart opertations
    func layoutCharts(){
        lineChart.heightAnchor.constraintEqualToConstant(240).active = true
        //lineChart.widthAnchor.constraintEqualToConstant(240).active = true
        lineChart.leftAnchor.constraintEqualToAnchor(self.view.leftAnchor, constant: 10).active = true
        //lineChart.centerXAnchor.constraintEqualToAnchor(self.view.centerXAnchor).active = true
        //lineChart.centerYAnchor.constraintEqualToAnchor(self.view.centerYAnchor).active = true
        
        self.view.layoutSubviews()
    }
    
    func setExampleChartData() {
        let xValues = ["1", "2", "3", "4"]
        var yValues = Array<ChartDataEntry>()
        yValues.append(ChartDataEntry(value: 1, xIndex: 0))
        yValues.append(ChartDataEntry(value: 2, xIndex: 1))
        yValues.append(ChartDataEntry(value: 3, xIndex: 2))
        yValues.append(ChartDataEntry(value: 2, xIndex: 3))
        lineChart.data = LineChartData(xVals: xValues, dataSets: [LineChartDataSet(yVals: yValues, label: "test")])
    }
    
    func parseList(data: String) -> [Double] {
        var retValue = Array<Double>()
        let x = data.characters.split(",")
        for i in x {
            retValue.append(Double(String(i))!)
        }
        return retValue
    }
    
    func setChartData(data: [Double]) {
        var xValues = Array<String>()
        var yValues = Array<ChartDataEntry>()
        
        for i in 0 ..< data.count {
            xValues.append(String(i))
            yValues.append(ChartDataEntry(value: data[i], xIndex: i))
        }
        lineChart.data = LineChartData(xVals: xValues, dataSets: [LineChartDataSet(yVals: yValues, label: "test")])
    }
    
    func initChart(){
        lineChart.backgroundColor = UIColor(white: 0.9, alpha: 1)
        lineChart.noDataText = "xxx"
    }
    
    //MARK: View Actions

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        initChart()
        setChartData([1,2,3,4])
        layoutCharts()
    }
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        lineChart.animate(yAxisDuration: 1)

    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        let firstView = self.tabBarController?.viewControllers![0] as! FirstViewController
        labelTest.text = firstView.textList.text
        setChartData(parseList(labelTest.text!))
        
        //lineChart.animate(yAxisDuration: 1)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

