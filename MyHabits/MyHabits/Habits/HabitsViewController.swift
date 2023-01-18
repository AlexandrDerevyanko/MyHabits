//
//  HabitsViewController.swift
//  MyHabits
//
//  Created by Aleksandr Derevyanko on 16.01.2023.
//

import UIKit

class HabitsViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray5
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Сегодня"
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = UIColor(red: 242/255.0, green: 242/255.0, blue: 247/255.0, alpha: 1.0)
        appearance.titleTextAttributes = [.foregroundColor: UIColor.black]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.black]
        navigationController?.navigationBar.tintColor = UIColor(red: 161/255.0, green: 22/255.0, blue: 204/255.0, alpha: 1.0)
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
    
    private func setupUI() {
        setupBarButtonItem()
    }
    
    private func setupBarButtonItem() {
        let baritem = UIBarButtonItem(image: UIImage(systemName: "folder"), style: .plain, target: self, action: #selector(tap))
        self.navigationItem.rightBarButtonItem = baritem
    }
    
    @objc private func tap() {
        let exampleController = HabitViewController()
        navigationController?.pushViewController(exampleController, animated: true)
    }
    
}
