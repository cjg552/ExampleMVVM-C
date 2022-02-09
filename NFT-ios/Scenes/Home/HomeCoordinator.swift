//
//  HomeCoordinator.swift
//  NFT-ios
//
//  Created by Carlos Jimenez on 17/1/22.
//

import UIKit

class HomeCoordinator: Coordinator {
    private var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    override func start() {
        
    }
    
    override func finish() {
        
    }
}

extension HomeCoordinator {
    func goToDetail(nft: NFT) {
        print("Go to detail \(nft.title)")
        
        let coordinator = DetailCoordinator(navigationController: navigationController, nft: nft)
        coordinator.delegate = self
        addChildCoordinator(coordinator)
        coordinator.start()
    }
}

extension HomeCoordinator: DetailCoordinatorDelegate {
    func didFinish(coordinator: DetailCoordinator) {
        removeChildCoordinator(coordinator)
        navigationController?.popViewController(animated: true)
    }
}
