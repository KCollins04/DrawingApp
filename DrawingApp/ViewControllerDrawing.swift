//
//  ViewControllerDrawing.swift
//  DrawingApp
//
//  Created by KELSEY COLLINS on 4/27/23.
//
import PencilKit
import UIKit

class ViewControllerDrawing: UIViewController {
    private let canvasView: PKCanvasView = {
        let canvas = PKCanvasView()
        //allows anyone to draw
        canvas.drawingPolicy = .anyInput
        return canvas
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(canvasView)

    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        canvasView.frame = view.bounds
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let toolPicker = PKToolPicker()
        toolPicker.setVisible(true, forFirstResponder: canvasView)
        toolPicker.addObserver(canvasView)
        canvasView.becomeFirstResponder()
    }

}
