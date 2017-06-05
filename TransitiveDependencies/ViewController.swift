//
//  ViewController.swift
//  TransitiveDependencies
//
//  Created by Michelline Tran on 5/10/17.
//  Copyright © 2017 MichellineTran. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func something(_ sender: Any) {
        let dep = Dependencies()
        dep.addDirect(node: "A", dependencies: ["B","C", "D", "J", "H", "I", "J", "K", "L", "M", "X", "W"])
        dep.addDirect(node: "B", dependencies: ["C", "E"])
        dep.addDirect(node: "E", dependencies: ["F"])
        dep.addDirect(node: "L", dependencies: ["M","I", "C", "H", "A", "E", "L", "K", "T", "O", "Y"])
        dep.addDirect(node: "J", dependencies: ["M","I", "C", "H", "A", "E"])
        dep.addDirect(node: "Z", dependencies: ["B","C", "D", "J", "H", "I", "J", "K", "L", "M"])
        dep.addDirect(node: "Y", dependencies: ["M","I", "C", "H", "A", "E", "L", "K", "T", "O"])
        dep.addDirect(node: "X", dependencies: ["M","I", "C", "H", "A", "E", "L", "K", "T", "O", "Z"])

        let nums = 1...10000
        let deps = nums.map { (num) -> String in
            return String(num)
        }
        dep.addDirect(node: "W", dependencies: deps)

        let actual = dep.dependenciesFor(node: "A")
        let expected = ["B", "C", "E", "F"]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

