//
//  ViewController.swift
//  GPLineChart
//
//  Created by Giampaolo Bellavite on 06/11/14.
//
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var chartContainer: UIView!
    var chart: GPLineChart?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        drawChart()
    }

    func drawChart() {
        
        chart = GPLineChart()
        
        let firstSerie = GPLineChartSerie(data: [(x: 0, y: 1), (x: 1, y: 2), (x: 2, y: 0), (x: 3, y: 5), (x: 4, y: 6)])
        let secondSerie = GPLineChartSerie(data: [(x: 0, y: -4.4), (x: 1, y: -0.2), (x: 2, y: -1), (x: 3, y: 0), (x: 4, y: 1)],
                                        options: ["area": false, "color": UIColor.redColor()])
        
        chart!.series.append(firstSerie)
        chart!.series.append(secondSerie)
        
        chartContainer.addSubview(chart!)
        
        // Constraints
        
        var views: Dictionary<String, AnyObject> = [:]
        views["chart"] = chart!
        chart?.setTranslatesAutoresizingMaskIntoConstraints(false)
        chartContainer.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-[chart]-|", options: nil, metrics: nil, views: views))
        chartContainer.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-[chart]-|", options: nil, metrics: nil, views: views))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

