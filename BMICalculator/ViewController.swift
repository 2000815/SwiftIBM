//
//  ViewController.swift
//  BMICalculator
//
//  Created by 市田圭司 on 2023/11/11.
//

import UIKit

class ViewController: UIViewController {
   
    @IBOutlet weak var weighttextfiled: UITextField!
    @IBOutlet weak var heigthtextfiled: UITextField!
    @IBOutlet weak var resulttext: UILabel!
    @IBOutlet weak var appropriateweight: UILabel!
    @IBOutlet weak var understandabletext: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        heigthtextfiled.placeholder = "身長を入力"
        weighttextfiled.placeholder = "体重を入力"
        
        resulttext.text = "0"
        appropriateweight.text = "0"
        understandabletext.text = ""
    }
    
    @IBAction func calcButtonAction(_ sender: Any) {
        let doubleH = Double(heigthtextfiled.text!)
        let doubleW = Double(weighttextfiled.text!)
        
        if doubleH == nil || doubleW == nil {
            resulttext.text = "入力してください"
            
            appropriateweight.text = "入力してください"
            
            return
        }
        
        let caluresult = caluAction(height: doubleH!, weight: doubleW!)
        resulttext.text = caluresult
        
        appropriateweight.text = calculateIdealWeight(height: doubleH!) + "kg"
        
        createunderstandabletext(resulttext: Double(caluresult)!)
        
    }
    
    func caluAction (height: Double, weight:Double) -> String{
        let h = height / 100
        let w = weight
        var result = w / (h * h)
        result = floor(result * 10) / 10
        
        return result.description
    }

    func calculateIdealWeight(height: Double) -> String{
        let idealWeight = pow(height, 2) * 22 / 10000
        print (idealWeight.description)
        return idealWeight.description
    }
    
    func createunderstandabletext(resulttext: Double) -> Void{
        
        if resulttext < 18.5 {
            understandabletext.text = "あなたは低体重です"
            understandabletext.textColor = .orange
        }else if resulttext >= 18.5 && resulttext < 25 {
            understandabletext.text = "あなたは普通体重です"
            understandabletext.textColor = UIColor(red: 0.2, green: 0.78, blue: 0.35, alpha: 1.0)
        } else if resulttext >= 25 && resulttext < 30 {
            understandabletext.text = "あなたは肥満(レベル１)です"
            understandabletext.textColor = .red
        } else if resulttext >= 30 && resulttext < 35 {
            understandabletext.text = "あなたは肥満(レベル2)です"
            understandabletext.textColor = .red
        } else if resulttext >= 35 && resulttext < 40 {
            understandabletext.text = "あなたは肥満(レベル3)です"
            understandabletext.textColor = .red
        } else {
            understandabletext.text = "あなたは肥満(レベル4)です"
            understandabletext.textColor = .red
        }
        
    }

}

