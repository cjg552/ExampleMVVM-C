//
//  AppCoordinator.swift
//  NFT-ios
//
//  Created by Carlos Jimenez on 17/1/22.
//

import Foundation
import UIKit

final class AppCoordinator: Coordinator {
    private var window: UIWindow?
    private var navigationController: UINavigationController!
    
    init(window: UIWindow?) {
        super.init()
        self.window = window
        setupNavigationBarAppearance()
    }
    
    override func start() {
        let networkRepository = NFTNetWorkRepository()
        let viewModel = HomeViewModel(repository: networkRepository)
        let homeVC = HomeViewController(viewModel: viewModel)
        navigationController = UINavigationController(rootViewController: homeVC)
        let coordinator = HomeCoordinator(navigationController: navigationController)
        viewModel.coordinator = coordinator
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
    
    override func finish() {
        
    }
    
    private func setupNavigationBarAppearance() {
        window?.tintColor = UIColor.customColor(type: .tintWindow)
        UINavigationBar.appearance().tintColor = UIColor.customColor(type: .tintWindow)
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.white
        appearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.black]
        
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
    
    
}
