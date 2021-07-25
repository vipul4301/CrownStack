//
//  Storyboarded.swift
//  CrownStack
//
//  Created by Vipul Kumar on 24/07/21.
//

import Foundation
import UIKit

public enum Storyboard : String {
    case splash       = "Spalsh"
    case songsList    = "SongsList"
    case songsDetails = "SongsDetails"
}

protocol Storyboarded {
    static func instantiate(name: String) -> Self
}

extension Storyboarded where Self: UIViewController {
    static func instantiate(name: String) -> Self {
        // this pulls out "MyApp.MyViewController"
        let fullName = NSStringFromClass(self)

        // this splits by the dot and uses everything after, giving "MyViewController"
        let className = fullName.components(separatedBy: ".")[1]

        // load our storyboard
        let storyboard = UIStoryboard(name: name, bundle: nil)

        // instantiate a view controller with that identifier, and force cast as the type that was requested
        return storyboard.instantiateViewController(withIdentifier: className) as! Self
    }
}
