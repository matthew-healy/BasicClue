//
//  ViewController.swift
//  BasicClue
//
//  Created by Matthew Healy on 11.07.17.
//  Copyright © 2017 Matthew Healy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let control = CircularControl()
        let sideLength = view.bounds.width * 0.8
        let xCoord = (view.bounds.width - sideLength) / 2
        let yCoord = (view.bounds.height - sideLength) / 2
        control.frame = CGRect(x: xCoord, y: yCoord, width: sideLength, height: sideLength)
        view.addSubview(control)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

