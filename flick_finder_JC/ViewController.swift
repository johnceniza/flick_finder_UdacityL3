//
//  ViewController.swift
//  flick_finder_JC
//
//  Created by John Ceniza on 8/11/15.
//  Copyright (c) 2015 AppDeco. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var theImage: UIImageView!
    @IBOutlet weak var phraseField: UITextField!
    @IBOutlet weak var longField: UITextField!
    @IBOutlet weak var latField: UITextField!
    @IBOutlet weak var imageTitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func phraseSearchPressed(sender: UIButton) {
        
    }
    
    @IBAction func latLongSearchPressed(sender: UIButton) {
        
    }

}

