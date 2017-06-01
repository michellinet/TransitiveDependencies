//
//  Dependencies.swift
//  TransitiveDependencies
//
//  Created by Michelline Tran on 5/10/17.
//  Copyright © 2017 MichellineTran. All rights reserved.
//

import Foundation

struct DependencyType {
    let node: String
    let dependencies: [String]
}

class Dependencies {

    var masterList = Array<DependencyType>()

    func addDirect(node: String, dependencies: [String]) {
        masterList.append(DependencyType(node: node, dependencies: dependencies))
    }

    func dependenciesFor(node: String) -> [String] {

        for dependency in masterList {
            if node == dependency.node {
                transitiveList.append(contentsOf: dependency.dependencies)
            }
        }

        self.addToList(list: transitiveList)

        return transitiveList
    }

    var transitiveList = Array<String>()

    func addToList(list: [String]) {
        for node in list {
            for dependency in masterList {
                if node == dependency.node {
                    for element in dependency.dependencies {
                        if !transitiveList.contains(element) {
                            transitiveList.append(element)
                            addToList(list: [element])
                        }
                    }
                }
            }

        }
    }
    

}
