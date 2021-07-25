//
//  Coordinator.swift
//  CrownStack
//
//  Created by Vipul Kumar on 24/07/21.
//

import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }

    func start()
}
