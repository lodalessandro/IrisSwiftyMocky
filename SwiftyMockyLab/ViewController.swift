//
//  ViewController.swift
//  SwiftyMockyLab
//
//  Created by Lorenzo on 26/05/24.
//

import UIKit
import SwiftyMocky
import Combine

class ViewController: UIViewController {

    @IBOutlet var segmentControlView: UISegmentedControl!
    @IBOutlet var label: UILabel!
    @IBOutlet var button: UIButton!
    
    private var viewModel: ViewModel = .init()
    private var cancellables = Set<AnyCancellable>()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupObservers()
    }
        
    private func setupViews() {
        segmentControlView.addTarget(self, action: #selector(segmentChanged(_:)), for: .valueChanged)
        button.addTarget(self, action: #selector(buttonTapped) , for: .touchUpInside)
    }
    
    private func setupObservers() {
        viewModel.$environment
            .sink { [weak self] environment in
                self?.label.text = nil
            }
            .store(in: &cancellables)
        
        viewModel.$fact
            .map { $0?.fact }
            .receive(on: DispatchQueue.main)
            .assign(to: \.text, on: label)
            .store(in: &cancellables)
    }
    
    @objc private func segmentChanged(_ sender: UISegmentedControl) {
        viewModel.updateEnvironment(index: sender.selectedSegmentIndex)
    }
    
    @objc private func buttonTapped() {
        Task {
            try await viewModel.fetchFact()
        }
    }
}
