//
//  ViewController.swift
//  guess
//
//  Created by Viswanath-Contractor, Karthik (CORP) on 12/21/15.
//  Copyright © 2015 adp. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // Image outlets
    @IBOutlet var tile0: UIImageView!
    @IBOutlet var tile1: UIImageView!
    @IBOutlet var tile2: UIImageView!
    @IBOutlet var tile3: UIImageView!
    @IBOutlet var tile4: UIImageView!
    @IBOutlet var tile5: UIImageView!
    @IBOutlet var tile6: UIImageView!
    @IBOutlet var tile7: UIImageView!
    @IBOutlet var tile8: UIImageView!
    
    // Guess button outlets
    @IBOutlet var bergmanButton: MyCustomButton!
    @IBOutlet var yousufButton: MyCustomButton!
    @IBOutlet var robertButton: MyCustomButton!
    @IBOutlet var brianButton: MyCustomButton!
    @IBOutlet var seanButton: MyCustomButton!
    @IBOutlet var rhemaButton: MyCustomButton!
    @IBOutlet var glebButton: MyCustomButton!
    @IBOutlet var karenButton: MyCustomButton!
    @IBOutlet var karthikButton: MyCustomButton!

    @IBOutlet var resultLabel: UILabel!
    
    // Vars 
    var clueOrder = [0, 8, 2, 6, 1, 5, 7, 3, 4]
    var clueStep = 0
    var tiles: [UIImageView] = []
    var imagesDictionary: [String: [UIImage]] = ["": []]
    var names: [String] = ["K Viswanath", "Y Bhuiyan"]
    var currentName: String = ""
    var score: Int = 100
    var totalScore : Int = 0
    
    // Image arrays
    var karthikImages: [UIImage] = [UIImage(named: "karthik00")!, UIImage(named: "karthik01")!, UIImage(named: "karthik02")!, UIImage(named: "karthik10")!, UIImage(named: "karthik11")!, UIImage(named: "karthik12")!, UIImage(named: "karthik20")!, UIImage(named: "karthik21")!, UIImage(named: "karthik22")!]
    
    // System default functions
    override func viewDidLoad() {
        super.viewDidLoad()
        clearAllImages()
        setTileIndex()
        setImageDictionary()
        pickRandomName()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // Capture motion gesture and reset the view to default
    override func canBecomeFirstResponder() -> Bool {
        return true
    }
    
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent?) {
        if motion == .MotionShake {
            clearAllImages()
            setTileIndex()
            setImageDictionary()
            pickRandomName()
        }
    }
    
    
    // UI Action functions
    @IBAction func showNextClue(sender: AnyObject) {
        tiles[clueOrder[clueStep]].image = imagesDictionary[currentName]![clueOrder[clueStep]]
        clueStep++
        score -= 10
        
    }

    @IBAction func validateName(sender: UIButton) {
        sender.enabled = false
        if (sender.titleLabel?.text == currentName) {
            updateResultLabel("Correct! \(score) Points")
            animateAllTilesFor(currentName)
            totalScore += score
        } else {
            updateResultLabel("Sorry, Wrong Guess - Try Again!")
        }
    }
    
    @IBAction func setNextPerson(sender: AnyObject) {
        clearAllImages()
        updateResultLabel("")
        enableAllGuessButtons()
        pickRandomName()
        clueStep = 0
        score = 100
    }
    
    // Custom functions
    
    func enableAllGuessButtons() {
        self.bergmanButton.enabled = true
        self.yousufButton.enabled = true
        self.robertButton.enabled = true
        self.brianButton.enabled = true
        self.seanButton.enabled = true
        self.rhemaButton.enabled = true
        self.glebButton.enabled = true
        self.karenButton.enabled = true
        self.karthikButton.enabled = true
    }
    
    func updateResultLabel(result: String) {
        self.resultLabel.numberOfLines = 0
        self.resultLabel.text = result
    }
    
    func clearAllImages() {
        self.tile0.image = nil
        self.tile1.image = nil
        self.tile2.image = nil
        self.tile3.image = nil
        self.tile4.image = nil
        self.tile5.image = nil
        self.tile6.image = nil
        self.tile6.image = nil
        self.tile7.image = nil
        self.tile8.image = nil
    }
    
    func setTileIndex() {
        tiles = [self.tile0, self.tile1, self.tile2, self.tile3, self.tile4, self.tile5, self.tile6, self.tile7, self.tile8]
    }
    
    func disableButton(customButton: MyCustomButton) {
        customButton.enabled = false
    }
    
    func setImageDictionary() {
        self.imagesDictionary = ["K Viswanath": karthikImages, "Y Bhuiyan": karthikImages]
    }
    
    func pickRandomName() {
        let num = Int(arc4random_uniform(UInt32(self.names.count)))
        print(self.names[num])
        self.currentName = self.names[num]
    }
    
    func animateAllTilesFor(name: String) {
        // make each tile animate
        
        let delayTime1 = dispatch_time(DISPATCH_TIME_NOW, Int64(0.2 * Double(NSEC_PER_SEC)))
        let delayTime2 = dispatch_time(DISPATCH_TIME_NOW, Int64(0.4 * Double(NSEC_PER_SEC)))
        let delayTime3 = dispatch_time(DISPATCH_TIME_NOW, Int64(0.6 * Double(NSEC_PER_SEC)))
        let delayTime4 = dispatch_time(DISPATCH_TIME_NOW, Int64(0.8 * Double(NSEC_PER_SEC)))

        self.tile0.image = imagesDictionary[name]![0]
        dispatch_after(delayTime1, dispatch_get_main_queue()) {
            self.tile1.image = self.imagesDictionary[name]![1]
            self.tile3.image = self.imagesDictionary[name]![3]
        }
        dispatch_after(delayTime2, dispatch_get_main_queue()) {
            self.tile2.image = self.imagesDictionary[name]![2]
            self.tile4.image = self.imagesDictionary[name]![4]
            self.tile6.image = self.imagesDictionary[name]![6]
        }
        dispatch_after(delayTime3, dispatch_get_main_queue()) {
            self.tile5.image = self.imagesDictionary[name]![5]
            self.tile7.image = self.imagesDictionary[name]![7]
        }
        dispatch_after(delayTime4, dispatch_get_main_queue()) {
            self.tile8.image = self.imagesDictionary[name]![8]
        }
    }
}

