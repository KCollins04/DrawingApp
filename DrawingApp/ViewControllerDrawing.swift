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
    
  
    
    
}
