//
//  ViewController.swift
//  CallBuddy
//
//  Created by Gabriel Chirico Mahtuk de Melo Sanzone on 20/12/23.
//

import UIKit

class ViewController: UIViewController {

    let callManager = CallManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        startDemo()
        // Do any additional setup after loading the view.
    }

    func startDemo() {
        DispatchQueue.main.asyncAfter(deadline: .now()+2, execute: {
            let callManager = CallManager()
            let id = UUID()
            callManager.reportIncomingCall(id: id, handle: "Tim Cook")
        })
    }


}

