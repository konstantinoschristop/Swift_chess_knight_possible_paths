//
//  ViewController.swift
//  Chess
//
//  Created by Konstantinos Christopoulos on 28/2/20.
//  Copyright © 2020 Konstantinos Christopoulos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var hasPressedStartingPos = false
    var xResetClicked = false
    var yResetClicked = false
    var intXstart: Int = 0
    var intYstart: Int = 0
    var intXend: Int = 0
    var intYend: Int = 0
    
    @IBOutlet weak var startLabel: UILabel!
    @IBOutlet weak var endLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        // knight can move 1 horizontal and 2 vertical positions or 1 vertical and 2 horizontal positions. there are 8 possible final destinations, so 8 different moves.
        
        //case (-2,-1)
        
        if intXstart - 2 == intXend, intYstart - 1 == intYend {
            resultLabel.text = "Possible Paths:\n (\(intXstart),\(intYstart)) -> (\(intXstart - 1),\(intYstart)) -> (\(intXstart - 2),\(intYstart)) -> (\(intXstart - 2),\(intYstart - 1))\n (\(intXstart),\(intYstart)) -> (\(intXstart),\(intYstart - 1)) -> (\(intXstart - 1),\(intYstart - 1)) -> (\(intXstart - 2),\(intYstart - 1))"
        }
            
            //case (-2,+1)
            
        else if intXstart - 2 == intXend, intYstart + 1 == intYend {
            resultLabel.text = "Possible Paths:\n (\(intXstart),\(intYstart)) -> (\(intXstart - 1),\(intYstart)) -> (\(intXstart - 2),\(intYstart)) -> (\(intXstart - 2),\(intYstart + 1))\n (\(intXstart),\(intYstart)) -> (\(intXstart),\(intYstart + 1)) -> (\(intXstart - 1),\(intYstart - 1)) -> (\(intXstart - 2),\(intYstart - 1))"
        }
            
            //case (-1,-2)
            
        else if intXstart - 1 == intXend, intYstart - 2 == intYend {
            resultLabel.text = "Possible Paths:\n (\(intXstart),\(intYstart)) -> (\(intXstart - 1),\(intYstart)) -> (\(intXstart - 1),\(intYstart - 1)) -> (\(intXstart - 1),\(intYstart - 2))\n (\(intXstart),\(intYstart)) -> (\(intXstart),\(intYstart - 1)) -> (\(intXstart),\(intYstart - 2)) -> (\(intXstart - 1),\(intYstart - 2))"
        }
            
            //case (-1,+2)
            
        else if intXstart - 1 == intXend, intYstart + 2 == intYend {
            resultLabel.text = "Possible Paths:\n (\(intXstart),\(intYstart)) -> (\(intXstart - 1),\(intYstart)) -> (\(intXstart - 1),\(intYstart + 1)) -> (\(intXstart - 1),\(intYstart + 2))\n (\(intXstart),\(intYstart)) -> (\(intXstart),\(intYstart + 1)) -> (\(intXstart),\(intYstart + 2)) -> (\(intXstart - 1),\(intYstart + 2))"
        }
            
            //case (+1,-2)
            
        else if intXstart + 1 == intXend, intYstart - 2 == intYend {
            resultLabel.text = "Possible Paths:\n (\(intXstart),\(intYstart)) -> (\(intXstart + 1),\(intYstart)) -> (\(intXstart + 1),\(intYstart - 1)) -> (\(intXstart + 1),\(intYstart - 2))\n (\(intXstart),\(intYstart)) -> (\(intXstart),\(intYstart - 1)) -> (\(intXstart),\(intYstart - 2)) -> (\(intXstart + 1),\(intYstart - 2))"
        }
            
            //case (+1,+2)
            
        else if intXstart + 1 == intXend, intYstart + 2 == intYend {
            resultLabel.text = "Possible Paths:\n (\(intXstart),\(intYstart)) -> (\(intXstart + 1),\(intYstart)) -> (\(intXstart + 1),\(intYstart + 1)) -> (\(intXstart + 1),\(intYstart + 2))\n (\(intXstart),\(intYstart)) -> (\(intXstart),\(intYstart + 1)) -> (\(intXstart),\(intYstart + 2)) -> (\(intXstart + 1),\(intYstart + 2))"
        }
            
            //case (+2,+1)
            
        else if intXstart + 2 == intXend, intYstart + 1 == intYend {
            resultLabel.text = "Possible Paths:\n (\(intXstart),\(intYstart)) -> (\(intXstart + 1),\(intYstart)) -> (\(intXstart + 2),\(intYstart)) -> (\(intXstart + 2),\(intYstart + 1))\n (\(intXstart),\(intYstart)) -> (\(intXstart),\(intYstart + 1)) -> (\(intXstart + 1),\(intYstart + 1)) -> (\(intXstart + 2),\(intYstart + 1))"
        }
            
            //case (+2,-1)
            
        else if intXstart + 2 == intXend, intYstart - 1 == intYend {
            resultLabel.text = "Possible Paths:\n (\(intXstart),\(intYstart)) -> (\(intXstart + 1),\(intYstart)) -> (\(intXstart + 2),\(intYstart)) -> (\(intXstart + 2),\(intYstart - 1))\n (\(intXstart),\(intYstart)) -> (\(intXstart),\(intYstart - 1)) -> (\(intXstart + 1),\(intYstart - 1)) -> (\(intXstart + 2),\(intYstart - 1))"
        }
            
            // no match
            
        else {
            resultLabel.text = "Path not Found"
        }
        
    }
    
    @IBAction func resetPressed(_ sender: UIButton) {
        hasPressedStartingPos = false
        xResetClicked = true
        yResetClicked = true
        startLabel.text = "Start: "
        endLabel.text = "End: "
        resultLabel.text = ""
    }
    
    
    @IBAction func startEndPoints(_ sender: UIButton) {
        if hasPressedStartingPos {
            let xEnd = sender.titleLabel!.text!.prefix(1)
            let yEnd = sender.titleLabel!.text!.suffix(1)
            
            intXend = Int(xEnd)!
            intYend = Int(yEnd)!
            endLabel.text = "End: (\(intXend),\(intYend))"
        }
        if xResetClicked {
            xResetClicked = false
        }
        
        
        if hasPressedStartingPos == false {
            let xStart = sender.titleLabel!.text!.prefix(1)
            let yStart = sender.titleLabel!.text!.suffix(1)
            
            intXstart = Int(xStart)!
            intYstart = Int(yStart)!
            
            startLabel.text = "Start: (\(intXstart),\(intYstart))"
            
            if yResetClicked {
                yResetClicked = false
            }
            hasPressedStartingPos = true
        }
    }
}

