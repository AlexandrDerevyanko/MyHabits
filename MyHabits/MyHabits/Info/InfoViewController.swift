//
//  InfoViewController.swift
//  MyHabits
//
//  Created by Aleksandr Derevyanko on 16.01.2023.
//

import UIKit

class InfoViewController: UIViewController {
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 20
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let titleLabel: UILabel = {
        let title = UILabel()
        title.font = UIFont(name: "Arial Bold", size: 20)
        title.textColor = .black
        title.text = textForTitleInfo
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    private let descriptionLabelOne: UILabel = {
        let description = UILabel()
        description.font = UIFont(name: "Arial normal", size: 14)
        description.textColor = .black
        description.numberOfLines = 0
        description.text = arraytextForDescriptionInfo[0]
        description.translatesAutoresizingMaskIntoConstraints = false
        return description
    }()
    
    private let descriptionLabelTwo: UILabel = {
        let description = UILabel()
        description.font = UIFont(name: "Arial normal", size: 14)
        description.textColor = .black
        description.numberOfLines = 0
        description.text = arraytextForDescriptionInfo[1]
        description.translatesAutoresizingMaskIntoConstraints = false
        return description
    }()
    
    private let descriptionLabelThree: UILabel = {
        let description = UILabel()
        description.font = UIFont(name: "Arial normal", size: 14)
        description.textColor = .black
        description.numberOfLines = 0
        description.text = arraytextForDescriptionInfo[2]
        description.translatesAutoresizingMaskIntoConstraints = false
        return description
    }()
    
    private let descriptionLabelFour: UILabel = {
        let description = UILabel()
        description.font = UIFont(name: "Arial normal", size: 14)
        description.textColor = .black
        description.numberOfLines = 0
        description.text = arraytextForDescriptionInfo[3]
        description.translatesAutoresizingMaskIntoConstraints = false
        return description
    }()
    
    private let descriptionLabelFive: UILabel = {
        let description = UILabel()
        description.font = UIFont(name: "Arial normal", size: 14)
        description.textColor = .black
        description.numberOfLines = 0
        description.text = arraytextForDescriptionInfo[4]
        description.translatesAutoresizingMaskIntoConstraints = false
        return description
    }()
    
    private let descriptionLabelSix: UILabel = {
        let description = UILabel()
        description.font = UIFont(name: "Arial normal", size: 14)
        description.textColor = .black
        description.numberOfLines = 0
        description.text = arraytextForDescriptionInfo[5]
        description.translatesAutoresizingMaskIntoConstraints = false
        return description
    }()
    
    private let descriptionLabelSeven: UILabel = {
        let description = UILabel()
        description.font = UIFont(name: "Arial normal", size: 14)
        description.textColor = .black
        description.numberOfLines = 0
        description.text = arraytextForDescriptionInfo[6]
        description.translatesAutoresizingMaskIntoConstraints = false
        return description
    }()
    
    private let descriptionLabelEight: UILabel = {
        let description = UILabel()
        description.font = UIFont(name: "Arial normal", size: 14)
        description.textColor = .black
        description.numberOfLines = 0
        description.text = arraytextForDescriptionInfo[7]
        description.translatesAutoresizingMaskIntoConstraints = false
        return description
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray5
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        title = "Информация"
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = UIColor(red: 242/255.0, green: 242/255.0, blue: 247/255.0, alpha: 1.0)
        appearance.titleTextAttributes = [.foregroundColor: UIColor.black]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.black]
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
    
    private func setupUI() {
        view.addSubview(scrollView)
        scrollView.addSubview(stackView)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(descriptionLabelOne)
        stackView.addArrangedSubview(descriptionLabelTwo)
        stackView.addArrangedSubview(descriptionLabelThree)
        stackView.addArrangedSubview(descriptionLabelFour)
        stackView.addArrangedSubview(descriptionLabelFive)
        stackView.addArrangedSubview(descriptionLabelSix)
        stackView.addArrangedSubview(descriptionLabelSeven)
        stackView.addArrangedSubview(descriptionLabelEight)
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 25),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -25)
        ])
    }

}
