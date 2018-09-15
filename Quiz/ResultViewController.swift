//
//  ResultViewController.swift
//  Quiz
//
//  Created by 宮倉宗平 on 2018/09/15.
//  Copyright © 2018年 Sohei Miyakura. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    
    var correctAnswer: Int = 0
    
    @IBOutlet weak var resultLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        resultLabel.text = String(correctAnswer)
    }

    @IBAction func back(_ sender: Any) {
        self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    

}
