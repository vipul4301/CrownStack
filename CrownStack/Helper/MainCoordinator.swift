//
//  MainCoordinator.swift
//  CrownStack
//
//  Created by Vipul Kumar on 24/07/21.
//

import UIKit
class MainCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let vc = SplashVC.instantiate(name: Storyboard.splash.rawValue)
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }
    func songsList() {
        let vc = SongsListVC.instantiate(name: Storyboard.songsList.rawValue)
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    func songsDetails(data: ResultsModel) {
        let vc = SongsDetailsVC.instantiate(name: Storyboard.songsDetails.rawValue)
        vc.songsDetails = data
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
}

