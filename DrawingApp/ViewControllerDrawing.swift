//
//  ViewControllerDrawing.swift
//  DrawingApp
//
//  Created by KELSEY COLLINS on 4/27/23.
//
import PencilKit
import UIKit

class ViewControllerDrawing: UIViewController, PKCanvasViewDelegate, PKToolPickerObserver {
    
   
    @IBOutlet weak var canvasView: PKCanvasView!
    var randomArray = ["House","School","Cat","Dog","Ice Cream","Sam Lim","Frog","Rainbow","Books","Basket","Rat","Popcorn","Bunny","Flowers","Egg","Llama Surfing","Pug on a treadmill",]
    
    @IBOutlet weak var randomOutlet: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(canvasView)
        canvasView.drawingPolicy = .anyInput
        canvasView.delegate = self
        
        if let window = parent?.view.window,
           let toolPicker = PKToolPicker.shared(for: window){
            toolPicker.addObserver(canvasView)
            toolPicker.setVisible(true, forFirstResponder: canvasView)
            canvasView.becomeFirstResponder()
        }
    }
    
    
    @IBAction func randombutton(_ sender: UIBarButtonItem) {
        randomOutlet.text = randomArray.randomElement()
    }
    
}
