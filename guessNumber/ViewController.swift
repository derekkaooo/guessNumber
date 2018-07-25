//
//  ViewController.swift
//  guessNumber
//
//  Created by Derek on 2018/7/25.
//  Copyright © 2018年 Derek. All rights reserved.
//

import UIKit
import GameKit

class ViewController: UIViewController {
    
    @IBOutlet weak var myTitle: UILabel!
    
    @IBOutlet weak var textLabel: UILabel!
    
    @IBOutlet weak var openImage: UIImageView!
    
    @IBOutlet weak var closeImage: UIImageView!
    
    //把答案設定亂數
    var answer = GKRandomSource.sharedRandom().nextInt(upperBound: 100) + 1
    //最大值
    var maxNumber = 100
    //最小值
    var minNumber = 1
    
    //按下textField會觸發func
    @IBAction func myTextField(_ sender: UITextField) {
        //如果textField有值
        if sender.text != nil{
            //偷偷印出答案
            print(answer)
            var inputText = sender.text
            var inputNumber = Int(inputText!)
            //如果輸入的值大於maxNumber
            if inputNumber! > maxNumber{
                textLabel.text = "輸入錯誤，請輸入\(minNumber) - \(maxNumber)"
                
            }else if inputNumber! < minNumber{
                textLabel.text = "輸入錯誤，請輸入\(minNumber) - \(maxNumber)"
            }else if inputNumber == answer{
                textLabel.text = "芝～麻～開～門～"
                openImage.isHidden = false
                closeImage.isHidden = true
            }else{
                //這邊主要功能是將範圍縮小
                if inputNumber! > answer{
                    maxNumber = inputNumber!
                }else{
                    minNumber = inputNumber!
                }
                textLabel.text = "輸入錯誤，請輸入\(minNumber) - \(maxNumber)"
            }
        }
        sender.text = ""
        
    }
    
    
    //按下按鈕，回到重玩的畫面(同時會到另一個viewcontroller)
    @IBAction func myButton(_ sender: UIButton) {
        var answer = GKRandomSource.sharedRandom().nextInt(upperBound: 100) + 1
        var maxNumber = 100
        var minNumber = 1
        textLabel.text = "請輸入數字 \(minNumber) - \(maxNumber)"
        openImage.isHidden = true
        closeImage.isHidden = false
    }
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return.lightContent
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let image = UIImage()
        self.navigationController?.navigationBar.setBackgroundImage(image, for: .default)
        // Do any additional setup after loading the view, typically from a nib.
    }


}

