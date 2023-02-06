//
//  HabitsCollectionViewCell.swift
//  MyHabits
//
//  Created by Aleksandr Derevyanko on 18.01.2023.
//

import UIKit

class HabitCollectionViewCell: UICollectionViewCell {
    
    var counter = 0
    var buttonColor: UIColor? = UIColor()
    var habit: Habit? = Habit(name: "1", date: Date(), color: UIColor())
    
    struct ViewModel {
        var name: String?
        var color: UIColor?
        var date: Date?
        var habit: Habit?
        var elementNumberInArray: Int?
        var arrayCounter: Int?
        var dateString: String?
    }
    
    private let habitTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17)
        label.textColor = .black
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let habitDescription: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .systemGray2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let habitCounter: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = .systemGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let habitButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 15
        button.layer.borderWidth = 1
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        layer.cornerRadius = 15
        clipsToBounds = true
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(with viewModel: ViewModel) {
        habitTitle.text = viewModel.name
        habitButton.layer.borderColor = viewModel.color?.cgColor
        habitDescription.text = "\(viewModel.dateString ?? "")"
        habitTitle.textColor = viewModel.color
        habitCounter.text = "Счетчик \(viewModel.arrayCounter ?? 0)"
        habit = viewModel.habit
        buttonColor = viewModel.color
        let checkHabit = viewModel.habit!.isAlreadyTakenToday
        if checkHabit == true {
            habitButton.backgroundColor = viewModel.color
            habitButton.setImage(UIImage(systemName: "checkmark"), for: [])
        } else {
            habitButton.backgroundColor = .white
            habitButton.setImage(UIImage(systemName: "checkmark"), for: [])
        }
    }
    
    private func setupUI() {
        addSubview(habitTitle)
        addSubview(habitButton)
        addSubview(habitDescription)
        addSubview(habitCounter)
        setupConstraints()
        addTargets()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            habitTitle.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            habitTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            
            habitButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            habitButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            habitButton.widthAnchor.constraint(equalToConstant: 30),
            habitButton.heightAnchor.constraint(equalToConstant: 30),
            
            habitDescription.topAnchor.constraint(equalTo: habitButton.bottomAnchor, constant: -16),
            habitDescription.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            
            habitCounter.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            habitCounter.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
        ])
    }
    
    private func addTargets() {
        habitButton.addTarget(self, action: #selector(tap), for: .touchUpInside)
    }
        
    @objc private func tap() {
        HabitsStore.shared.track(habit!)
        NotificationCenter.default.post(name: HabitsViewController.notificationName, object: nil)
        if habit!.isAlreadyTakenToday == true {
            habitButton.backgroundColor = buttonColor
            habitButton.setImage(UIImage(systemName: "checkmark"), for: [])
            reloadInputViews()
        }
    }
    
}

