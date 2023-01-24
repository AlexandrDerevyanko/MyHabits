//
//  HabitsViewController.swift
//  MyHabits
//
//  Created by Aleksandr Derevyanko on 16.01.2023.
//

import UIKit

class HabitsViewController: UIViewController {
    
    private enum Constants {
        static let numberOfItemsInLIne: CGFloat = 1
    }
    
    private lazy var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
//        layout.minimumInteritemSpacing = 100
//        layout.minimumLineSpacing = 100
//        layout.sectionInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        layout.estimatedItemSize = CGSize(width: UIScreen.main.bounds.width - 32, height: 120)
        return layout
    }()
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(HabitCollectionViewCell.self, forCellWithReuseIdentifier: "CustomCell")
        collectionView.register(ProgressCollectionViewCell.self, forCellWithReuseIdentifier: "ProgressCell")
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "DefaultCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.layer.cornerRadius = 15
        collectionView.layer.masksToBounds = true
        collectionView.backgroundColor = .systemGray5
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray5
        setupUI()
//        HabitsStore.shared.track(HabitsStore.shared.habits[1])
//        print(HabitsStore.shared.habits[1].name)
//        print(HabitsStore.shared.todayProgress)
//        print(HabitsStore.shared.habits[1])
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        collectionView.reloadData()
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
        view.addSubview(collectionView)
        setupBarButtonItem()
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 8),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -8)
        ])
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

extension HabitsViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProgressCell", for: indexPath) as? ProgressCollectionViewCell else {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DefaultCell", for: indexPath)
                return cell
            }
            cell.clipsToBounds = true
            let post = HabitsStore.shared.todayProgress
            let publications = ProgressCollectionViewCell.ViewModel(percent: post)
            cell.setup(with: publications)
            return cell
        }
        if indexPath.section == 1 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCell", for: indexPath) as? HabitCollectionViewCell else {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DefaultCell", for: indexPath)
                return cell
            }
            
            cell.clipsToBounds = true
            let post = HabitsStore.shared.habits[indexPath.row]
            let publications = HabitCollectionViewCell.ViewModel(name: post.name, color: post.color, date: post.date, habit: post, elementNumberInArray: indexPath.row)
            cell.setup(with: publications)
            return cell
        }
        return TechnicalCollectionViewCell()
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else if section == 1 {
            return HabitsStore.shared.habits.count
        }
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 8
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return 8
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0 {
            let width = collectionView.frame.width - 16
            return CGSize(width: width, height: 80)
        } else if indexPath.section == 1 {
            let width = collectionView.frame.width - 16
            return CGSize(width: width, height: 120)
        }
        return CGSize()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.section == 1 {
            let exampleController = HabitDetailsViewController()
            navigationController?.pushViewController(exampleController, animated: true)
        }
    }
    
}
