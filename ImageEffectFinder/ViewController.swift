//
//  ViewController.swift
//  ImageEffectFinder
//
//  Created by Nathan Hancock on 5/5/16.
//  Copyright © 2016 NateHancock. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var mainImage: UIImageView?
    
    @IBOutlet weak var blurSlider: UISlider?
    @IBOutlet weak var blurValue: UILabel?
    @IBOutlet weak var satSlider: UISlider?
    @IBOutlet weak var satValue: UILabel?
    
    @IBOutlet weak var whiteSlider: UISlider?
    @IBOutlet weak var whiteValue: UILabel?

    @IBOutlet weak var alphaSlider: UISlider?
    @IBOutlet weak var alphaValue: UILabel?
    
    var originalImage: UIImage?
    
    var blurNum: Float?
    var satNum: Float?
    var whiteNum: Float?
    var alphaNum: Float?

    override func viewDidLoad() {
        super.viewDidLoad()
        blurValue?.text = String(blurSlider!.value)
        satValue?.text = String(satSlider!.value)
        whiteValue?.text = String(whiteSlider!.value)
        alphaValue?.text = String(alphaSlider!.value)
        
        blurNum = blurSlider?.value
        satNum = satSlider?.value
        whiteNum = whiteSlider?.value
        alphaNum = alphaSlider?.value
        
        
        let starWars = UIImage(named: "poster.jpg")
        mainImage?.image = starWars
        originalImage = mainImage?.image
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func updateImage(){
        mainImage?.image = originalImage!.applyBlurWithRadius(CGFloat(blurNum!), tintColor: UIColor(white: CGFloat(whiteNum!), alpha: CGFloat(alphaNum!)), saturationDeltaFactor: CGFloat(satNum!))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func blurSliderDidMove(sender: UISlider){
        blurValue?.text = String(sender.value)
        blurNum = blurSlider?.value
        updateImage()
    }
    
    @IBAction func satSliderDidMove(sender: UISlider){
        satValue?.text = String(sender.value)
        satNum = satSlider?.value
        updateImage()
    }
    
    @IBAction func whiteSliderDidMove(sender: UISlider){
        whiteValue?.text = String(sender.value)
        whiteNum = whiteSlider?.value
        updateImage()
    }
    
    @IBAction func alphaSliderDidMove(sender: UISlider){
        alphaValue?.text = String(sender.value)
        alphaNum = alphaSlider?.value
        updateImage()
    }

}

