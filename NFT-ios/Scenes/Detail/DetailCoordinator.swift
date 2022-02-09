//
//  DetailCoordinator.swift
//  NFT-ios
//
//  Created by Carlos Jimenez on 22/1/22.
//

import Foundation
import UIKit

protocol DetailCoordinatorDelegate: AnyObject {
    func didFinish(coordinator: DetailCoordinator)
}
                                

class DetailCoordinator: Coordinator {
    var navigationController: UINavigationController!
    var nft: NFT!
    
    weak var delegate: DetailCoordinatorDelegate?
    
    init(navigationController: UINavigationController?, nft: NFT) {
        super.init()
        self.navigationController = navigationController
        self.nft = nft
    }
    
    override func start() {
        let viewModel = DetailViewModel(nft: nft)
        viewModel.coordinator = self
        let vc = DetailViewController(viewModel: viewModel)
        navigationController.pushViewController(vc, animated: true)
    }
    
    override func finish() {
        delegate?.didFinish(coordinator: self)
    }
}

