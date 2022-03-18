//
//  ViewController.swift
//  copenhagen-weather
//
//  Created by Vinícius Barcelos on 14/03/22.
//

import UIKit
import Combine

class CityWeatherViewController: UIViewController {
    let viewModel: CityWeatherViewModel
    var viewData: CityWeatherViewData?
    
    private lazy var loadingView: UIActivityIndicatorView = {
        let activityIndicatorView = UIActivityIndicatorView()
        activityIndicatorView.translatesAutoresizingMaskIntoConstraints = false
        activityIndicatorView.hidesWhenStopped = true
        return activityIndicatorView
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.sectionHeaderTopPadding = 0
        tableView.register(WeatherHeaderView.self, forHeaderFooterViewReuseIdentifier: WeatherHeaderView.identifier)
        tableView.register(WeatherTableViewCell.self, forCellReuseIdentifier: WeatherTableViewCell.identifier)
        return tableView
    }()
    
    init(viewModel: CityWeatherViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.viewModel.delegate = self
        setupHierarchy()
        setupConstraints()
        configureViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.load()
    }
    
    private func setupHierarchy() {
        tableView.addSubview(loadingView)
        view.addSubview(tableView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            loadingView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loadingView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    private func configureViews() {
        view.backgroundColor = .white
        title = "Weather"
    }
}

extension CityWeatherViewController: CityWeatherViewModelDelegate {
    func viewModelDidChangedState(to state: ViewState) {
        loadingView.stopAnimating()
        
        switch state {
        case .loading:
            loadingView.startAnimating()
        case .loaded(let cityForecastViewData):
            self.viewData = cityForecastViewData
            tableView.reloadData()
        case .error(let errorDescription):
            presentError(with: errorDescription)
        }
    }
}

extension CityWeatherViewController {
    private func presentError(with message: String?) {
        let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let tryAgainAction = UIAlertAction(title: "Try again", style: .default) { [weak self] _ in
            self?.viewModel.load()
        }
        alertController.addAction(tryAgainAction)
        present(alertController, animated: true)
    }
}

extension CityWeatherViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewData?.forecast.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: WeatherTableViewCell.identifier, for: indexPath) as? WeatherTableViewCell else { fatalError() }
        if let viewData = viewData {
            cell.configure(viewData: viewData.forecast[indexPath.row])
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: WeatherHeaderView.identifier) as? WeatherHeaderView else { fatalError() }
        if let viewData = viewData {
            view.configure(viewData: viewData)
        }
        return view
    }
}
