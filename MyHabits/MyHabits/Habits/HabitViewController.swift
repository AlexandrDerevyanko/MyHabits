//
//  HabitViewController.swift
//  MyHabits
//
//  Created by Aleksandr Derevyanko on 17.01.2023.
//

import UIKit

class HabitViewController: UIViewController, UIColorPickerViewControllerDelegate {
    
    private lazy var colorPicker = makeColorPicker()
    
    var habit: Habit
    var isChange: Bool
    var index: Int
    var habitDate: Date
    var habitName: String
    var habitColor: UIColor
    init(habit: Habit, isChange: Bool, index: Int) {
        self.habit = habit
        self.isChange = isChange
        self.index = index
        self.habitDate = habit.date
        self.habitName = habit.name
        self.habitColor = habit.color
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    private let titleLabel: UILabel = {
        let title = UILabel()
        title.font = UIFont.systemFont(ofSize: 17)
        title.textColor = .black
        title.text = "НАЗВАНИЕ"
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    private let textField: UITextField = {
        let text = UITextField()
        text.textColor = .black
        text.backgroundColor = .white
        text.font = UIFont.systemFont(ofSize: 16)
        text.placeholder = "Бегать по утрам, спать 8 часов и т.п."
        text.autocapitalizationType = .none
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    private let colorLabel: UILabel = {
        let title = UILabel()
        title.font = UIFont.systemFont(ofSize: 17)
        title.textColor = .black
        title.text = "ЦВЕТ"
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    private let colorButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 255/255.0, green: 159/255.0, blue: 79/255.0, alpha: 1.0)
        button.layer.cornerRadius = 15
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let deleteButton: UIButton = {
       let button = UIButton()
        button.backgroundColor = .systemBackground
        button.setTitle("Удалить привычку", for: .normal)
        button.setTitleColor(UIColor.red, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let timeLabel: UILabel = {
        let title = UILabel()
        title.font = UIFont.systemFont(ofSize: 17)
        title.textColor = .black
        title.text = "Время"
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    private let firstTimeDescriptionLabel: UILabel = {
        let description = UILabel()
        description.font = UIFont.systemFont(ofSize: 17)
        description.textColor = .black
        description.text = "Каждый день в"
        description.translatesAutoresizingMaskIntoConstraints = false
        return description
    }()
    
    private let secondTimeDescriptionLabel: UILabel = {
        let description = UILabel()
        description.font = UIFont.systemFont(ofSize: 17)
        description.textColor = UIColor(red: 161/255.0, green: 22/255.0, blue: 204/255.0, alpha: 1.0)
        description.text = timeForView
        description.translatesAutoresizingMaskIntoConstraints = false
        return description
    }()
    
    let timePicker: UIDatePicker = {
        let time = UIDatePicker()
        time.datePickerMode = .countDownTimer
        time.date = .now
        time.translatesAutoresizingMaskIntoConstraints = false
        return time
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setup()
        setupUI()
        addTargets()
        print(habitDate)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = false
        title = "Создать"
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = UIColor(red: 242/255.0, green: 242/255.0, blue: 247/255.0, alpha: 1.0)
        appearance.titleTextAttributes = [.foregroundColor: UIColor.black]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.black]
        navigationController?.navigationBar.tintColor = UIColor(red: 161/255.0, green: 22/255.0, blue: 204/255.0, alpha: 1.0)
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if touches.first != nil {
            view.endEditing(true)
        }
        super.touchesBegan(touches, with: event)
    }
    
    func setup() {
        colorButton.backgroundColor = habitColor
        textField.text = habitName
        deleteButton.isHidden = isChange ? false : true
    }
    
    func colorPickerViewControllerDidSelectColor(_ viewController: UIColorPickerViewController) {
        colorButton.backgroundColor = viewController.selectedColor
        habitColor = viewController.selectedColor
        }
    
    private func setupUI() {
        view.addSubview(deleteButton)
        view.addSubview(titleLabel)
        view.addSubview(textField)
        view.addSubview(colorLabel)
        view.addSubview(colorButton)
        view.addSubview(timeLabel)
        view.addSubview(firstTimeDescriptionLabel)
        view.addSubview(secondTimeDescriptionLabel)
        view.addSubview(timePicker)
        setupConstraints()
        setupBarButtonItem()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            
            textField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 15),
            textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            
            colorLabel.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 15),
            colorLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            
            colorButton.topAnchor.constraint(equalTo: colorLabel.bottomAnchor, constant: 15),
            colorButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            colorButton.heightAnchor.constraint(equalToConstant: 30),
            colorButton.widthAnchor.constraint(equalToConstant: 30),
            
            timeLabel.topAnchor.constraint(equalTo: colorButton.bottomAnchor, constant: 15),
            timeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            
            firstTimeDescriptionLabel.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: 15),
            firstTimeDescriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            
            secondTimeDescriptionLabel.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: 15),
            secondTimeDescriptionLabel.leadingAnchor.constraint(equalTo: firstTimeDescriptionLabel.trailingAnchor, constant: 15),
            
            timePicker.topAnchor.constraint(equalTo: firstTimeDescriptionLabel.bottomAnchor, constant: 15),
            timePicker.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            
            deleteButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            deleteButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    private func addTargets() {
        colorButton.addTarget(self, action: #selector(tapOnColorBotton), for: .touchUpInside)
        timePicker.addTarget(self, action: #selector(saveDate), for: .valueChanged)
        textField.addTarget(self, action: #selector(saveName), for: .editingChanged)
        deleteButton.addTarget(self, action: #selector(alertAction), for: .touchUpInside)
    }
    
    private func makeColorPicker() -> UIColorPickerViewController {
        let vc = UIColorPickerViewController()
        vc.delegate = self
        vc.selectedColor = UIColor(red: 255/255.0, green: 159/255.0, blue: 79/255.0, alpha: 1.0)
        vc.supportsAlpha = true
        return vc
    }

    private func presentColorPicker() {
        present(colorPicker, animated: true)
    }
    
    private func setupBarButtonItem() {
        let leftBarItem = UIBarButtonItem(title: "Отменить", style: .plain, target: self, action: #selector(cancel))
        let rightBarItem = UIBarButtonItem(title: "Сохранить", style: .plain, target: self, action: #selector(save))
        self.navigationItem.leftBarButtonItem = leftBarItem
        self.navigationItem.rightBarButtonItem = rightBarItem
    }
    
    @objc private func alertAction() {
        let alert = UIAlertController(title: "Удалить привычку", message: "Вы хотите удалить привычку \(habitName) ?", preferredStyle: .alert)
        let firstAction = UIAlertAction(title: "Удалить", style: .destructive) {_ in
            HabitsStore.shared.habits.remove(at: self.index)
            self.navigationController?.popToRootViewController(animated: true)
        }
        let secontAction = UIAlertAction(title: "Отмена", style: .default)
        alert.addAction(firstAction)
        alert.addAction(secontAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    @objc private func cancel() {
        navigationController?.popToRootViewController(animated: true)
    }
    
    @objc private func save() {
        let habitValues = Habit(name: habitName,
                             date: habitDate,
                             color: habitColor)
        
        if isChange == true {
            HabitsStore.shared.habits[index].color = habitColor
            HabitsStore.shared.habits[index].name = habitName
            HabitsStore.shared.save()
        } else {
            HabitsStore.shared.habits.append(habitValues)
        }
        
        navigationController?.popToRootViewController(animated: true)
    }
    
    @objc private func tapOnColorBotton() {
        presentColorPicker()
    }
    
    @objc private func saveDate() {
        habitDate = timePicker.date
        secondTimeDescriptionLabel.text = dateFormatter.string(from: habitDate)
    }
    
    @objc private func saveName() {
        habitName = textField.text!
    }
    
}
