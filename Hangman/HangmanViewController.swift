//
//  ViewController.swift
//  Hangman
//
//  Created by Gene Yoo on 10/13/15.
//  Copyright © 2015 cs198-ios. All rights reserved.
//

import UIKit

extension String
{
    subscript (i: Int) -> Character
    {
        return self[self.startIndex.advancedBy(i)]
    }
    
    subscript (i: Int) -> String
    {
        return String(self[i] as Character)
    }
}

class HangmanViewController: UIViewController {
    
    var answer = ""
    var wrongCnt = 0
    var soFar = ""
    
    @IBOutlet var aBtn: UIButton!
    @IBOutlet var bBtn: UIButton!
    @IBOutlet var cBtn: UIButton!
    @IBOutlet var dBtn: UIButton!
    @IBOutlet var eBtn: UIButton!
    @IBOutlet var fBtn: UIButton!
    @IBOutlet var gBtn: UIButton!
    @IBOutlet var hBtn: UIButton!
    @IBOutlet var iBtn: UIButton!
    @IBOutlet var jBtn: UIButton!
    @IBOutlet var kBtn: UIButton!
    @IBOutlet var lBtn: UIButton!
    @IBOutlet var mBtn: UIButton!
    @IBOutlet var nBtn: UIButton!
    @IBOutlet var oBtn: UIButton!
    @IBOutlet var pBtn: UIButton!
    @IBOutlet var qBtn: UIButton!
    @IBOutlet var rBtn: UIButton!
    @IBOutlet var sBtn: UIButton!
    @IBOutlet var tBtn: UIButton!
    @IBOutlet var uBtn: UIButton!
    @IBOutlet var vBtn: UIButton!
    @IBOutlet var wBtn: UIButton!
    @IBOutlet var xBtn: UIButton!
    @IBOutlet var yBtn: UIButton!
    @IBOutlet var zBtn: UIButton!
    @IBOutlet var guessBtn: UIButton!
    @IBOutlet var newGameBtn: UIButton!
    @IBOutlet var imageView: UIImageView!
    
    @IBOutlet var displayLabel: UILabel!
    @IBOutlet var statusLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let words = HangmanWords()

        answer = words.getRandomWord()
        print(answer)
        var tmpDisplay: String = ""
        for(var i = 0; i < answer.characters.count; i++)
        {
            if(answer[i] == " ")
            {
                soFar += " "
                tmpDisplay += "  "
            }
            else
            {
                soFar += "_"
                tmpDisplay += "_ "
            }
        }
        
        displayLabel.text = tmpDisplay
        statusLabel.text = ""
        
        imageView.image = UIImage(named: "hangman1.gif")
        
        aBtn.addTarget(self, action: "aBtnPress", forControlEvents: .TouchUpInside)
        bBtn.addTarget(self, action: "bBtnPress", forControlEvents: .TouchUpInside)
        cBtn.addTarget(self, action: "cBtnPress", forControlEvents: .TouchUpInside)
        dBtn.addTarget(self, action: "dBtnPress", forControlEvents: .TouchUpInside)
        eBtn.addTarget(self, action: "eBtnPress", forControlEvents: .TouchUpInside)
        fBtn.addTarget(self, action: "fBtnPress", forControlEvents: .TouchUpInside)
        gBtn.addTarget(self, action: "gBtnPress", forControlEvents: .TouchUpInside)
        hBtn.addTarget(self, action: "hBtnPress", forControlEvents: .TouchUpInside)
        iBtn.addTarget(self, action: "iBtnPress", forControlEvents: .TouchUpInside)
        jBtn.addTarget(self, action: "jBtnPress", forControlEvents: .TouchUpInside)
        kBtn.addTarget(self, action: "kBtnPress", forControlEvents: .TouchUpInside)
        lBtn.addTarget(self, action: "lBtnPress", forControlEvents: .TouchUpInside)
        mBtn.addTarget(self, action: "mBtnPress", forControlEvents: .TouchUpInside)
        nBtn.addTarget(self, action: "nBtnPress", forControlEvents: .TouchUpInside)
        oBtn.addTarget(self, action: "oBtnPress", forControlEvents: .TouchUpInside)
        pBtn.addTarget(self, action: "pBtnPress", forControlEvents: .TouchUpInside)
        qBtn.addTarget(self, action: "qBtnPress", forControlEvents: .TouchUpInside)
        rBtn.addTarget(self, action: "rBtnPress", forControlEvents: .TouchUpInside)
        sBtn.addTarget(self, action: "sBtnPress", forControlEvents: .TouchUpInside)
        tBtn.addTarget(self, action: "tBtnPress", forControlEvents: .TouchUpInside)
        uBtn.addTarget(self, action: "uBtnPress", forControlEvents: .TouchUpInside)
        vBtn.addTarget(self, action: "vBtnPress", forControlEvents: .TouchUpInside)
        wBtn.addTarget(self, action: "wBtnPress", forControlEvents: .TouchUpInside)
        xBtn.addTarget(self, action: "xBtnPress", forControlEvents: .TouchUpInside)
        yBtn.addTarget(self, action: "yBtnPress", forControlEvents: .TouchUpInside)
        zBtn.addTarget(self, action: "zBtnPress", forControlEvents: .TouchUpInside)
        newGameBtn.addTarget(self, action: "newGamePress", forControlEvents: .TouchUpInside)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func answerProcess(ch: String)
    {
        var isAnswer: Bool = false
        var tmpDisplay: String = ""
        
        for(var i = 0; i < answer.characters.count; i++)
        {
            if(ch == answer[i])
            {
                isAnswer = true
                var tmp: String = ""
                tmpDisplay = ""
                for(var k = 0; k < answer.characters.count; k++)
                {
                    if(soFar[k] == " ")
                    {
                        tmp += " "
                        tmpDisplay += "  "
                    }
                    else if(k == i)
                    {
                        tmp += ch
                        tmpDisplay += ch
                    }
                    else if(soFar[k] == "_")
                    {
                        tmp += "_"
                        tmpDisplay += "_ "
                    }
                    else
                    {
                        tmp += soFar[k]
                        tmpDisplay += soFar[k]
                    }
                }
                soFar = tmp
            }
        }
        
        if(isAnswer)
        {
            statusLabel.text = "Correct Guess!!!"
            displayLabel.text = tmpDisplay
            var isFinished: Bool = true
            
            for(var i = 0; i < soFar.characters.count; i++)
            {
                if(soFar[i] == "_")
                {
                    isFinished = false
                    break
                }
            }
            
            if(isFinished)
            {
                statusLabel.text = "You Win!!"
                let alert = UIAlertController(title: "Congratz", message: "You Win!!!", preferredStyle: UIAlertControllerStyle.Alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
                self.presentViewController(alert, animated: true, completion: nil)
            }
        }
        else
        {
            statusLabel.text = "Wrong Guess!!"
            wrongCnt += 1
            
            let imageName: String = "hangman" + String(wrongCnt+1) + ".gif"
            
            imageView.image = UIImage(named: imageName)
            
            if(wrongCnt >= 6)
            {
                statusLabel.text = "You Lose!!!"
                let alert = UIAlertController(title: "TT", message: "You Lose!!", preferredStyle: UIAlertControllerStyle.Alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
                self.presentViewController(alert, animated: true, completion: nil)
                
                displayLabel.text = answer
                wrongCnt -= 1
            }
        }
    }
    
    func newGamePress()
    {
        let words = HangmanWords()
        wrongCnt = 0
        soFar = ""
        
        answer = words.getRandomWord()
        for(var i = 0; i < answer.characters.count; i++)
        {
            if(answer[i] == " ")
            {
                soFar += " "
            }
            else
            {
                soFar += "_"
            }
        }
        
        displayLabel.text = soFar
        
        imageView.image = UIImage(named: "hangman1.gif")
    }
    
    func aBtnPress()
    {
        answerProcess("A")
    }
    func bBtnPress()
    {
        answerProcess("B")
    }
    func cBtnPress()
    {
        answerProcess("C")
    }
    func dBtnPress()
    {
        answerProcess("D")
    }
    func eBtnPress()
    {
        answerProcess("E")
    }
    func fBtnPress()
    {
        answerProcess("F")
    }
    func gBtnPress()
    {
        answerProcess("G")
    }
    func hBtnPress()
    {
        answerProcess("H")
    }
    func iBtnPress()
    {
       answerProcess("I")
    }
    func jBtnPress()
    {
        answerProcess("J")
    }
    func kBtnPress()
    {
        answerProcess("K")
    }
    func lBtnPress()
    {
        answerProcess("L")
    }
    func mBtnPress()
    {
        answerProcess("M")
    }
    func nBtnPress()
    {
        answerProcess("N")
    }
    func oBtnPress()
    {
        answerProcess("O")
    }
    func pBtnPress()
    {
        answerProcess("P")
    }
    func qBtnPress()
    {
        answerProcess("Q")
    }
    func rBtnPress()
    {
        answerProcess("R")
    }
    func sBtnPress()
    {
        answerProcess("S")
    }
    func tBtnPress()
    {
        answerProcess("T")
    }
    func uBtnPress()
    {
        answerProcess("U")
    }
    func vBtnPress()
    {
        answerProcess("V")
    }
    func wBtnPress()
    {
        answerProcess("W")
    }
    func xBtnPress()
    {
        answerProcess("X")
    }
    func yBtnPress()
    {
        answerProcess("Y")
    }
    func zBtnPress()
    {
        answerProcess("Z")
    }
}

