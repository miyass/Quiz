//
//  QuizViewController.swift
//  Quiz
//
//  Created by 宮倉宗平 on 2018/09/15.
//  Copyright © 2018年 Sohei Miyakura. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {
    
    var quizArray = [Any]()
    
    var correctAnswer: Int = 0
    
    @IBOutlet weak var quizTextView: UITextView!
    
    @IBOutlet weak var chooseButton1: UIButton!
    @IBOutlet weak var chooseButton2: UIButton!
    @IBOutlet weak var chooseButton3: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        var tmpArray = [Any]()
        
        tmpArray.append(["Appleの2015年のCEOの名前は？", "スティーブジョブズ", "ティムクック", "俺", 2])
        tmpArray.append(["iPhoneに導入された、画面タッチの圧力を検出する機能の名は？", "3Dタッチ", "4Dタッチ", "スーパータッチ", 1])
        tmpArray.append(["iPod touchの最大容量は？", "64", "128", "256", 2])
        tmpArray.append(["1985年にジョブズが立ち上げた会社とは？", "NeXT", "Nexus", "Null", 1])
        tmpArray.append(["現在のOS名は？", "high Sierra", "lion", "yosemite", 1])
        tmpArray.append(["Apple watch欲しい？", "はい", "いいえ", "どちらでもない", 1])
        
        while ( tmpArray.count > 0) {
            let index = Int(arc4random()) % tmpArray.count
            quizArray.append(tmpArray[index])
            tmpArray.remove(at: index)
        }
        choiceQuiz()
    }
    
    func choiceQuiz() {
            let tmpArray = quizArray[0] as! [Any]
        quizTextView.text = tmpArray[0] as! String
        
        chooseButton1.setTitle(tmpArray[1] as? String, for: .normal)
        chooseButton2.setTitle(tmpArray[2] as? String, for: .normal)
        chooseButton3.setTitle(tmpArray[3] as? String, for: .normal)
    }
    
    func performSegueToResult() {
        performSegue(withIdentifier: "toResultView", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toResultView" {
            let resultViewController = segue.destination as! ResultViewController
            resultViewController.correctAnswer = self.correctAnswer
        }
    }
    
    @IBAction func choiceAnswer(sender: UIButton) {
        let tmpArray = quizArray[0] as! [Any]
        
        if tmpArray[4] as! Int == sender.tag {
            correctAnswer = correctAnswer + 1
        }
        
        quizArray.remove(at: 0)
        
        if quizArray.count == 0 {
            performSegueToResult()
        } else {
            choiceQuiz()
        }
    }
    

}
