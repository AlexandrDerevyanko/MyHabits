//
//  HabitsCollectionViewCell.swift
//  MyHabits
//
//  Created by Aleksandr Derevyanko on 18.01.2023.
//

import UIKit

class HabitCollectionViewCell: UICollectionViewCell {
    
    var buttonColor: UIColor? = UIColor()
    var habitDate: String = ""
    var habit: Habit? = Habit(name: "1", date: Date(), color: UIColor())
    var habitElementNumberInArray: Int? = 0
    
    struct ViewModel {
        var name: String?
        var color: UIColor?
        var date: Date?
        var habit: Habit?
        var elementNumberInArray: Int?
    }
    
    private let habitTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Arial", size: 17)
        label.textColor = .black
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let habitDescription: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Arial", size: 12)
        label.textColor = .systemGray2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let habitCounter: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Arial", size: 13)
        label.textColor = .systemGray
        label.text = "Счетчик: 0"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let habitButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 15
        button.layer.borderWidth = 1
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
    
    override func prepareForReuse() {
        super.prepareForReuse()
        habitTitle.text = nil
        habitButton.layer.borderColor = nil
        habitButton.backgroundColor = nil
        buttonColor = nil
        habitDescription.text = nil
    }
    
    func setup(with viewModel: ViewModel) {
//        let habitElement = HabitsStore.shared.habits[(habitElementNumberInArray)!]
        habitTitle.text = viewModel.name
        habitButton.layer.borderColor = viewModel.color?.cgColor
        buttonColor = viewModel.color
        habitDescription.text = "Каждый день в \(dateFormatter.string(from: viewModel.date ?? Date()))"
        habit = viewModel.habit
        habitElementNumberInArray = viewModel.elementNumberInArray
//        if habitElement.isAlreadyTakenToday == true {
//            habitButton.backgroundColor = viewModel.color
//        } else {
//            habitButton.backgroundColor = .white
//        }
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
        habitButton.addTarget(self, action: #selector(tapOnHabbitButton), for: .touchUpInside)
    }
    
    private func track() {
        let habitElement = HabitsStore.shared.habits[(habitElementNumberInArray)!]
        HabitsStore.shared.track(habitElement)
    }
    
    @objc private func tapOnHabbitButton() {
        habitButton.backgroundColor = buttonColor
        track()
    }
    
}

